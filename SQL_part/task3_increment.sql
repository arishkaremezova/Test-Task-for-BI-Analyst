CREATE TEMP TABLE temp_client_txn AS
SELECT
 client_id,
 MIN(txn_dt) AS min_txn_dt,
 MAX(txn_dt) AS max_txn_dt
FROM
 ft_card_txn
WHERE
 txn_dt = CURRENT_DATE  
GROUP BY
 client_id;

UPDATE dm_client_txn
SET
 first_txn_dt = CASE
  WHEN t.min_txn_dt < first_txn_dt THEN t.min_txn_dt
  ELSE first_txn_dt
 END,
 last_txn_dt = CASE
  WHEN t.max_txn_dt > last_txn_dt THEN t.max_txn_dt
  ELSE last_txn_dt
 END
FROM temp_client_txn t
WHERE dm_client_txn.client_id = t.client_id
AND (t.min_txn_dt < dm_client_txn.first_txn_dt OR t.max_txn_dt > dm_client_txn.last_txn_dt);

INSERT INTO dm_client_txn (client_id, first_txn_dt, last_txn_dt)
SELECT
 t.client_id,
 t.min_txn_dt,
 t.max_txn_dt
FROM temp_client_txn t
WHERE NOT EXISTS (
 SELECT 1
 FROM dm_client_txn
 WHERE dm_client_txn.client_id = t.client_id
);
DROP TABLE temp_client_txn;

CREATE TABLE dm_client_txn (
    client_id INTEGER,
    first_txn_dt DATE,
    last_txn_dt DATE
);

INSERT INTO dm_client_txn (client_id, first_txn_dt, last_txn_dt)
VALUES
    (101, '2015-03-20', '2018-09-10'),
    (102, '2017-03-01', '2018-09-15'),
    (103, '2018-09-05', '2018-09-20');

CREATE TABLE ft_card_txn (
    txn_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    txn_dt DATE,
    client_id INTEGER,
    txn_type INTEGER,
    txn_amt DECIMAL(15, 2) 
);

INSERT INTO ft_card_txn (txn_dt, client_id, txn_type, txn_amt)
VALUES
    ('2018-09-01', 101, 2596, 100.00),
    ('2018-09-10', 101, 3487, 1490.45),
    ('2018-09-15', 102, 1010, 800.50),
    ('2018-09-05', 103, 3056, 30000.00),
    ('2018-09-20', 103, 2849, 150.80);

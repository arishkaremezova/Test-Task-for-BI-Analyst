SELECT DISTINCT
    t3.name AS item3,
    sub.item2 AS item4
FROM
    things t3
JOIN
(
    SELECT
        t1.name AS item1,
        t2.name AS item2,
		t1.id AS item3,
        t2.id AS item4
    FROM
        things t1
    JOIN
        things t2 ON t1.name > t2.name or (t1.name = t2.name and t1.id != t2.id)
) AS sub ON t3.name >= sub.item1;

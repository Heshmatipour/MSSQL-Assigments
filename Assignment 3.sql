CREATE TABLE Actions
(
Visitor_ID INT,
Adv_Type CHAR(1),
Action VARCHAR(10)
);

INSERT INTO Actions (Visitor_ID, Adv_Type, Action)
VALUES (1, 'A', 'Left'), (2, 'A', 'Order'), (3, 'B', 'Left'), (4, 'A', 'Order'), (5, 'A', 'Review'),
(6, 'A', 'Left'), (7, 'B', 'Left'), (8, 'B', 'Order'), (9, 'B', 'Review'), (10, 'A', 'Review') 


SELECT Adv_Type,
COUNT(*) as 'Conversion Rate'
FROM Actions
WHERE Action = 'Order'
GROUP BY Adv_Type

SELECT Adv_Type,
COUNT(*) as 'Total'
FROM Actions
GROUP BY Adv_Type

/* SELECT DISTINCT Adv_Type, 1.0 * A.Conversion_Rate/B.Conversion_Rate AS Conversion_Rate FROM
(SELECT DISTINCT Adv_Type, COUNT(*) AS Conversion_Rate from Actions WHERE Action = 'Order' GROUP BY Adv_Type) A
JOIN
(SELECT DISTINCT COUNT(*) AS Conversion_Rate FROM Actions GROUP BY Adv_Type) B ON Adv_Type=Adv_Type */

WITH cte AS
(SELECT Adv_Type, COUNT(*) Num FROM Actions GROUP BY Adv_Type)
SELECT Actions.Adv_Type, cte.Num, count(action) * 1.0 / cte.Num AS Conversion_Rate
FROM actions
JOIN cte
ON Actions.Adv_Type = cte.Adv_Type
WHERE Action = 'Order'
GROUP BY Actions.Adv_Type, cte.NUM
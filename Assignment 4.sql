CREATE TABLE Discount
(
Prod_id INT,
Discounts VARCHAR(20),
Orders INT
);

INSERT INTO Discount (Prod_id, Discounts, Orders)
VALUES (1,'No',0), (2,'Yes',5), (3,'Yes',6), (4,'Yes',4), (5,'No',1),
(6,'No',0), (7,'No',2), (8,'Yes',5), (9, 'Yes', 4), (10,'Yes',8)

SELECT *
FROM Discount

SELECT Prod_id, CASE
	WHEN Orders > (SELECT AVG(Orders) FROM Discount)
	AND Discounts = 'Yes'
		THEN 'Positive'
	WHEN Orders > (SELECT AVG(Orders) FROM Discount)
	AND Discounts = 'No'
		THEN 'Neutral'
	WHEN Orders < (SELECT AVG(Orders) FROM Discount)
	AND Discounts = 'Yes'
		THEN 'Negative'
	WHEN Orders < (SELECT AVG(Orders) FROM Discount)
	AND Discounts = 'No'
		THEN 'Negative'
	END AS Discount_Effect
FROM Discount
GROUP BY Prod_id, Orders, Discounts;

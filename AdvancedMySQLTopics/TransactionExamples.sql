START TRANSACTION

INSERT INTO Orders (OrderID, ClientID, ProductID, Quantity, Cost, Date)
VALUES (22, "Cl1", "P1", 10, 500, "2022-09-01");

UPDATE Products 
SET NumberOfItems = (NumberOfItems - 10)
WHERE ProductID = "P1";

SELECT 
Orders.OrderID, 
Orders.Quantity, 
Products.ProductID, 
Products.NumberOfItems
FROM Orders
INNER JOIN Products 
ON (Orders.ProductID = Products.ProductID)
WHERE Orders.OrderID = 22;


START TRANSACTION;

INSERT INTO Orders(OrderID, ClientID, ProductID, Quantity, Cost, Date)
VALUES (30, "Cl1", "P1", 10, 500, "2022-09-30");

UPDATE Products
SET NumberOfItems = (NumberOfItems -10)
WHERE ProductID = "P1";

SELECT
Orders.OrderID,
Orders.ClientID,
Orders.Quantity,
Products.ProductID,
Products.NumberOfItems
FROM Orders
INNER JOIN Products
ON (Orders.ProductID = Products.ProductID)
WHERE Orders.OrderID = 30;

--ROLLBACK or COMMIT (depending on the outcome of the final SELECT statement).

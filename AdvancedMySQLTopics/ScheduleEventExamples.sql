--One-time schedule event:**

DELIMITER //

CREATE EVENT GenerateRevenueReport
ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 12 HOUR
DO
BEGIN
INSERT INTO ReportData (OrderID, ClientID, ProductID, Quantity, Cost, Date)
SELECT *
FROM Orders
WHERE Date
BETWEEN '2022-08-01' AND '2022-08-31';
END //

DELIMITER ;

--Recurring scheduled event:**

DELIMITER //

CREATE EVENT DailyRestock
ON SCHEDULE
EVERY 1 DAY
DO
BEGIN
IF Products.NumberOfItems < 50 THEN
UPDATE Porducts SET NumberOfItems = 50;
END //

DELIMITER ;

CREATE DATABASE Lucky_Shrub;

USE Lucky_Shrub;

CREATE TABLE Orders (
OrderID INT NOT NULL PRIMARY KEY, 
ClientID VARCHAR(10), 
ProductID VARCHAR(10), 
Quantity INT, 
Cost DECIMAL(6,2), Date DATE
);

INSERT INTO Orders(OrderID, ClientID, ProductID , Quantity, Cost, Date) 
VALUES
(1, "Cl1", "P1", 10, 500, "2020-09-01"),  
(2, "Cl2", "P2", 5, 100, "2020-09-05"),  
(3, "Cl3", "P3", 20, 800, "2020-09-03"),  
(4, "Cl4", "P4", 15, 150, "2020-09-07"),  
(5, "Cl3", "P3", 10, 450, "2020-09-08"),  
(6, "Cl2", "P2", 5, 800, "2020-09-09"),  
(7, "Cl1", "P4", 22, 1200, "2020-09-10"),  
(8, "Cl3", "P1", 15, 150, "2020-09-10"),  
(9, "Cl1", "P1", 10, 500, "2020-09-12"),  
(10, "Cl2", "P2", 5, 100, "2020-09-13"),  
(11, "Cl4", "P5", 5, 100, "2020-09-15"), 
(12, "Cl1", "P1", 10, 500, "2022-09-01"),  
(13, "Cl2", "P2", 5, 100, "2022-09-05"),  
(14, "Cl3", "P3", 20, 800, "2022-09-03"),  
(15, "Cl4", "P4", 15, 150, "2022-09-07"),  
(16, "Cl3", "P3", 10, 450, "2022-09-08"),  
(17, "Cl2", "P2", 5, 800, "2022-09-09"),  
(18, "Cl1", "P4", 22, 1200, "2022-09-10"),  
(19, "Cl3", "P1", 15, 150, "2022-09-10"),  
(20, "Cl1", "P1", 10, 500, "2022-09-12"),  
(21, "Cl2", "P2", 5, 100, "2022-09-13"),   
(22, "Cl2", "P1", 10, 500, "2021-09-01"),  
(23, "Cl2", "P2", 5, 100, "2021-09-05"),  
(24, "Cl3", "P3", 20, 800, "2021-09-03"),  
(25, "Cl4", "P4", 15, 150, "2021-09-07"),  
(26, "Cl1", "P3", 10, 450, "2021-09-08"),  
(27, "Cl2", "P1", 20, 1000, "2022-09-01"),  
(28, "Cl2", "P2", 10, 200, "2022-09-05"),  
(29, "Cl3", "P3", 20, 800, "2021-09-03"),  
(30, "Cl1", "P1", 10, 500, "2022-09-01")
;

--Task 1**: Create a SQL function that prints the cost value of a specific order based on the user input of the OrderID.

DELIMITER //
CREATE FUNCTION CostValueOfOrder(orderNo INT)
RETURNS DECIMAL(5,2) DETERMINISTIC
BEGIN
RETURN(SELECT Cost FROM Orders WHERE OrderID = orderNo);
END //
DELIMITER ;

SELECT CostValueOfOrder(5);

/*
+---------------------+
| CostValueOfOrder(5) |
+---------------------+
|              450.00 |
+---------------------+
*/

--Task 2**: Create a stored procedure called GetDiscount. This stored procedure must return the final cost of the customer's order after the discount value has been deducted. 
--The discount value is based on the order's quantity. The stored procedure must have the following specifications: 
--The procedure should take one parameter that accepts a user input value of an OrderID. 
--The procedure must find the order quantity of the specific OrderID. 
--If the value of the order quantity is more than or equal to 20 then the procedure should return the new cost after a 20% discount. 
--If the value of the order quantity is less than 20 and more than or equal to 10 then the procedure should return the new cost after a 10% discount.


DELIMITER //

CREATE PROCEDURE GetDiscount(IN orderNo INT, OUT cost_after_discount DECIMAL(5, 2))
BEGIN
SELECT
CASE 
	WHEN Quantity >= 20 THEN (Cost - (Cost * 20 / 100))
	WHEN Quantity < 20 AND Quantity >= 10 THEN (Cost - (Cost * 10 / 100))
	ELSE Cost
END INTO cost_after_discount
FROM Orders 
WHERE OrderID = orderNo;
END //
DELIMITER ;

CALL GetDiscount(5, @cost_after_discount);

SELECT @cost_after_discount;

/*
+----------------------+
| @cost_after_discount |
+----------------------+
|               405.00 |
+----------------------+
*/

--alternate solution:

DELIMITER //

CREATE PROCEDURE GetDiscount(OrderIDInput INT)
BEGIN
DECLARE cost_after_discount DECIMAL(7,2);
DECLARE current_cost DECIMAL(7,2);
DECLARE order_quantity INT;
SELECT Quantity INTO order_quantity FROM Orders WHERE OrderID = OrderIDInput;
SELECT Cost INTO current_cost FROM Orders WHERE OrderID = OrderIDInput;
IF order_quantity >= 20 then
SET cost_after_discount = current_cost - (current_cost * 0.2);
ELSEIF (order_quantity >=10) THEN 
SET cost_after_discount = current_cost - (current_cost * 0.1);
ELSE SET cost_after_discount = current_cost;
END IF;
SELECT cost_after_discount;
END //

DELIMITER ;

CALL GetDiscount(5);




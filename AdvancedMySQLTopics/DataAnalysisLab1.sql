CREATE DATABASE IF NOT EXISTS Lucky_Shrub;

USE Lucky_Shrub;

CREATE TABLE Clients (
ClientID VARCHAR(10),
FullName VARCHAR(100), 
ContactNumber INT, 
AddressID INT
);

CREATE TABLE Orders (
OrderID INT NOT NULL PRIMARY KEY,
ClientID VARCHAR(10),
ProductID VARCHAR(10),
Quantity INT,
Cost DECIMAL(6,2),
Date DATE
);

CREATE TABLE Products (
ProductID VARCHAR(10),
ProductName VARCHAR(100),
BuyPrice DECIMAL(6,2),
SellPrice DECIMAL(6,2),
NumberOfItems INT
);

CREATE TABLE Addresses (
AddressID INT PRIMARY KEY,
Street VARCHAR(255),
County VARCHAR(100)
);

INSERT INTO Clients(ClientID, FullName, ContactNumber, AddressID) 
VALUES 
("Cl1", "Takashi Ito", 351786345, 1), 
("Cl2", "Jane Murphy", 351567243, 2), 
("Cl3", "Laurina Delgado", 351342597, 3), 
("Cl4", "Benjamin Clauss", 351342509, 4), 
("Cl5", "Altay Ayhan", 351208983, 5), 
("Cl6", "Greta Galkina", 351298755, 6)
;

INSERT INTO Orders (OrderID, ClientID, ProductID , Quantity, Cost, Date)
VALUES 
(1, "Cl1", "P1", 10, 500, "2020-09-01" ), 
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

INSERT INTO Products (ProductID, ProductName, BuyPrice, SellPrice, NumberOfItems)
VALUES 
("P1", "Artificial grass bags ", 40, 50, 100), 
("P2", "Wood panels", 15, 20, 250), 
("P3", "Patio slates",  35, 40, 60), 
("P4", "Sycamore trees ", 7, 10, 50), 
("P5", "Trees and Shrubs", 35, 50, 75), 
("P6", "Water fountain", 65, 80, 15)
;

INSERT INTO Addresses (AddressID, Street, County) 
VALUES 
(1, ",291 Oak Wood Avenue", "Graham County"), 
(2, "724 Greenway Drive", "Pinal County"), 
(3, "102 Sycamore Lane", "Santa Cruz County"), 
(4, "125 Roselawn Close", "Gila County"), 
(5, "831 Beechwood Terrace", "Cochise County"),
(6, "755 Palm Tree Hills", "Mohave County"), 
(7, "751 Waterfall Hills", "Tucson County") , 
(8, "878 Riverside Lane", "Tucson County") , 
(9, "908 Seaview Hills", "Tucson County"), 
(10, "243 Waterview Terrace", "Tucson County"), 
(11, "148 Riverview Lane", "Tucson County"),  
(12, "178 Seaview Avenue", "Tucson County")
;

--Task 1**: Lucky Shrub need to find out how many sycamore trees they’ve sold over the past few years. Sycamore trees have been assigned an ID of P4 in the products table in the database. Create a query that returns the total quantity of all products with the ID of P4 sold in the years 2020, 2021 and 2022.

SELECT CONCAT (SUM(Quantity), "(2020)") AS "P4 product: Quantity sold" FROM Orders WHERE YEAR (Date) = 2020 AND ProductID = "P4"
UNION 
SELECT CONCAT (SUM(Quantity), "(2021)") FROM Orders WHERE YEAR (Date) = 2021 AND ProductID = "P4"
UNION 
SELECT CONCAT (SUM(Quantity), "(2022)") FROM Orders WHERE YEAR (Date) = 2022 AND ProductID = "P4";

/*
+---------------------------+
| P4 product: Quantity sold |
+---------------------------+
| 37(2020)                  |
| 15(2021)                  |
| 37(2022)                  |
+---------------------------+
*/

--Task 2**: Lucky Shrub need information on all their clients and the orders that they placed in the years 2022 and 2021. See if you can help them by extracting the required information from each of the following tables:
--Clients table: The client id and contact number for each client who placed an order
--Addresses table: The street and county for each client’s address
--Orders table: The order id, cost and date of each client’s order.
--Products table: The name of each product ordered.

SELECT
Clients.ClientID,
Clients.ContactNumber,
Addresses.Street,
Addresses.County,
Orders.OrderID,
Products.ProductID,
Products.ProductName,
Orders.Cost,
Orders.Date
FROM Clients
INNER JOIN Addresses
INNER JOIN Orders
INNER JOIN Products ON (Clients.AddressID = Addresses.AddressID AND Clients.ClientID = Orders.ClientID AND Orders.ProductID = Products.ProductID)
WHERE (YEAR(Date) IN (2021, 2022));

/*
+----------+---------------+----------------------+-------------------+---------+-----------+------------------------+---------+------------+
| ClientID | ContactNumber | Street               | County            | OrderID | ProductID | ProductName            | Cost    | Date       |
+----------+---------------+----------------------+-------------------+---------+-----------+------------------------+---------+------------+
| Cl1      |     351786345 | ,291 Oak Wood Avenue | Graham County     |      30 | P1        | Artificial grass bags  |  500.00 | 2022-09-01 |
| Cl2      |     351567243 | 724 Greenway Drive   | Pinal County      |      27 | P1        | Artificial grass bags  | 1000.00 | 2022-09-01 |
| Cl2      |     351567243 | 724 Greenway Drive   | Pinal County      |      22 | P1        | Artificial grass bags  |  500.00 | 2021-09-01 |
| Cl1      |     351786345 | ,291 Oak Wood Avenue | Graham County     |      20 | P1        | Artificial grass bags  |  500.00 | 2022-09-12 |
| Cl3      |     351342597 | 102 Sycamore Lane    | Santa Cruz County |      19 | P1        | Artificial grass bags  |  150.00 | 2022-09-10 |
| Cl1      |     351786345 | ,291 Oak Wood Avenue | Graham County     |      12 | P1        | Artificial grass bags  |  500.00 | 2022-09-01 |
| Cl2      |     351567243 | 724 Greenway Drive   | Pinal County      |      28 | P2        | Wood panels            |  200.00 | 2022-09-05 |
| Cl2      |     351567243 | 724 Greenway Drive   | Pinal County      |      23 | P2        | Wood panels            |  100.00 | 2021-09-05 |
| Cl2      |     351567243 | 724 Greenway Drive   | Pinal County      |      21 | P2        | Wood panels            |  100.00 | 2022-09-13 |
| Cl2      |     351567243 | 724 Greenway Drive   | Pinal County      |      17 | P2        | Wood panels            |  800.00 | 2022-09-09 |
| Cl2      |     351567243 | 724 Greenway Drive   | Pinal County      |      13 | P2        | Wood panels            |  100.00 | 2022-09-05 |
| Cl3      |     351342597 | 102 Sycamore Lane    | Santa Cruz County |      29 | P3        | Patio slates           |  800.00 | 2021-09-03 |
| Cl1      |     351786345 | ,291 Oak Wood Avenue | Graham County     |      26 | P3        | Patio slates           |  450.00 | 2021-09-08 |
| Cl3      |     351342597 | 102 Sycamore Lane    | Santa Cruz County |      24 | P3        | Patio slates           |  800.00 | 2021-09-03 |
| Cl3      |     351342597 | 102 Sycamore Lane    | Santa Cruz County |      16 | P3        | Patio slates           |  450.00 | 2022-09-08 |
| Cl3      |     351342597 | 102 Sycamore Lane    | Santa Cruz County |      14 | P3        | Patio slates           |  800.00 | 2022-09-03 |
| Cl4      |     351342509 | 125 Roselawn Close   | Gila County       |      25 | P4        | Sycamore trees         |  150.00 | 2021-09-07 |
| Cl1      |     351786345 | ,291 Oak Wood Avenue | Graham County     |      18 | P4        | Sycamore trees         | 1200.00 | 2022-09-10 |
| Cl4      |     351342509 | 125 Roselawn Close   | Gila County       |      15 | P4        | Sycamore trees         |  150.00 | 2022-09-07 |
+----------+---------------+----------------------+-------------------+---------+-----------+------------------------+---------+------------+
*/

--Task 3**: Lucky Shrub needs to analyze the sales performance of their Patio slates product in the year 2021. This product has a Product ID of P3. Help Lucky Shrub to analyze the performance of this product by developing a function called FindSoldQuantity that enables them to:
--Input a ProductID and a year from which they can capture data and display the total quantity of the product sold in the given year.

CREATE FUNCTION FindSoldQuantity (product_id VARCHAR(10), YearInput INT) 
returns INT DETERMINISTIC 
RETURN (SELECT SUM(Quantity) 
FROM Orders 
WHERE ProductID = product_id 
AND YEAR (Date) = YearInput);

SELECT FindSoldQuantity ("P3", 2021);

/*
+-------------------------------+
| FindSoldQuantity ("P3", 2021) |
+-------------------------------+
|                            50 |
+-------------------------------+
*/


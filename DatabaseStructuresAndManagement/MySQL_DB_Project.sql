CREATE DATABASE IF NOT EXISTS Little_Lemon;

USE Little_Lemon;

CREATE TABLE Customers (
CustomerID INT NOT NULL PRIMARY KEY, 
FullName VARCHAR(100) NOT NULL, 
PhoneNumber INT NOT NULL UNIQUE
);

INSERT INTO Customers(CustomerID, FullName, PhoneNumber) 
VALUES 
(1, "Vanessa McCarthy", 0757536378), 
(2, "Marcos Romero", 0757536379), 
(3, "Hiroki Yamane", 0757536376), 
(4, "Anna Iversen", 0757536375), 
(5, "Diana Pinto", 0757536374),     
(6, "Altay Ayhan", 0757636378),      
(7, "Jane Murphy", 0753536379),      
(8, "Laurina Delgado", 0754536376),      
(9, "Mike Edwards", 0757236375),     
(10, "Karl Pederson", 0757936374)
;

CREATE TABLE Bookings (
BookingID INT, 
BookingDate DATE,
TableNumber INT, 
NumberOfGuests INT,
CustomerID INT
);

INSERT INTO Bookings (BookingID, BookingDate, TableNumber, NumberOfGuests, CustomerID) 
VALUES 
(10, '2021-11-10', 7, 5, 1),  
(11, '2021-11-10', 5, 2, 2),  
(12, '2021-11-10', 3, 2, 4), 
(13, '2021-11-11', 2, 5, 5),  
(14, '2021-11-11', 5, 2, 6),  
(15, '2021-11-11', 3, 2, 7), 
(16, '2021-11-11', 3, 5, 1),  
(17, '2021-11-12', 5, 2, 2),  
(18, '2021-11-12', 3, 2, 4), 
(19, '2021-11-13', 7, 5, 6),  
(20, '2021-11-14', 5, 2, 3),  
(21, '2021-11-14', 3, 2, 4)
;

CREATE TABLE Courses (
CourseName VARCHAR(255) PRIMARY KEY, 
Cost Decimal(4,2)
);

INSERT INTO Courses (CourseName, Cost)
VALUES 
("Greek salad", 15.50), 
("Bean soup", 12.25), 
("Pizza", 15.00), 
("Carbonara", 12.50), 
("Kabasa", 17.00), 
("Shwarma", 11.30)
;

--Task 1**: Filter data using the WHERE clause and logical operators.
--Create SQL statement to print all records from Bookings table for the following bookings dates using the BETWEEN operator: 2021-11-11, 2021-11-12 and 2021-11-13.

SELECT *
FROM Bookings
WHERE BookingDate BETWEEN '2021-11-11' AND '2021-11-13';

/*
+-----------+-------------+-------------+----------------+------------+
| BookingID | BookingDate | TableNumber | NumberOfGuests | CustomerID |
+-----------+-------------+-------------+----------------+------------+
|        13 | 2021-11-11  |           2 |              5 |          5 |
|        14 | 2021-11-11  |           5 |              2 |          6 |
|        15 | 2021-11-11  |           3 |              2 |          7 |
|        16 | 2021-11-11  |           3 |              5 |          1 |
|        17 | 2021-11-12  |           5 |              2 |          2 |
|        18 | 2021-11-12  |           3 |              2 |          4 |
|        19 | 2021-11-13  |           7 |              5 |          6 |
+-----------+-------------+-------------+----------------+------------+
*/

--Task 2**: Create a JOIN query.
--Create a JOIN SQL statement on the Customers and Bookings tables. The statement must print the customers full names and related bookings IDs from the date 2021-11-11.

SELECT
C.FullName,
B.BookingID
FROM Customers AS C
INNER JOIN Bookings AS B ON C.CustomerID = B.CustomerID
WHERE B.BookingDate = '2021-11-11';

/*
+------------------+-----------+
| FullName         | BookingID |
+------------------+-----------+
| Diana Pinto      |        13 |
| Altay Ayhan      |        14 |
| Jane Murphy      |        15 |
| Vanessa McCarthy |        16 |
+------------------+-----------+
*/

--Task 3**: Create a GROUP BY query.
--Create a SQL statement to print the bookings dates from Bookings table. The statement must show the total number of bookings placed on each of the printed dates using the GROUP BY BookingDate.

SELECT
BookingDate,
COUNT(CustomerID) AS TotalBookings
FROM Bookings
GROUP BY BookingDate;

/*
+-------------+---------------+
| BookingDate | TotalBookings |
+-------------+---------------+
| 2021-11-10  |             3 |
| 2021-11-11  |             4 |
| 2021-11-12  |             2 |
| 2021-11-13  |             1 |
| 2021-11-14  |             2 |
+-------------+---------------+
*/

--Task 4**: Create a REPLACE statement.
--Create a SQL REPLACE statement that updates the cost of the Kabasa course from $17.00 to $20.00.

REPLACE INTO Courses
SET CourseName = "Kabasa", Cost = 20.00;

/*
+-------------+-------+
| CourseName  | Cost  |
+-------------+-------+
| Bean soup   | 12.25 |
| Carbonara   | 12.50 |
| Greek salad | 15.50 |
| Kabasa      | 20.00 |
| Pizza       | 15.00 |
| Shwarma     | 11.30 |
+-------------+-------+
*/

--Task 5**: Create constraints
--Create a new table called "DeliveryAddress" in the Little Lemon database with the following columns and constraints:
--ID: INT PRIMARY KEY
--Address: VARCHAR(255) NOT NULL
--Type: NOT NULL DEFAULT "Private"
--CustomerID: INT NOT NULL FOREIGN KEY referencing CustomerID in the Customers table

CREATE TABLE DeliveryAddress (
ID INT, Address VARCHAR(255) NOT NULL,
Type VARCHAR(100) NOT NULL DEFAULT 'Private',
CustomerID INT NOT NULL,
PRIMARY KEY (ID),
FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID)
);

/*
+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| ID         | int          | NO   | PRI | NULL    |       |
| Address    | varchar(255) | NO   |     | NULL    |       |
| Type       | varchar(100) | NO   |     | Private |       |
| CustomerID | int          | NO   | MUL | NULL    |       |
+------------+--------------+------+-----+---------+-------+
*/

--Task 6**: Alter table structure
--Create a SQL statement that adds a new column called 'Ingredients' to the Courses table.
--Ingredients: VARCHAR(255)

ALTER TABLE Courses
ADD COLUMN Ingredients VARCHAR(255);

/*
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| CourseName  | varchar(255) | NO   | PRI | NULL    |       |
| Cost        | decimal(4,2) | YES  |     | NULL    |       |
| Ingredients | varchar(255) | YES  |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
*/

--Task 7**: Create a subquery
--Create a SQL statement with a subquery that prints the full names of all customers who made bookings in the restaurant on the following date: 2021-11-11.

SELECT
FullName
FROM Customers
WHERE EXISTS (SELECT * FROM Bookings WHERE Bookings.CustomerID = Customers.CustomerID AND BookingDate = '2021-11-11');

/*
+------------------+
| FullName         |
+------------------+
| Diana Pinto      |
| Altay Ayhan      |
| Jane Murphy      |
| Vanessa McCarthy |
+------------------+
*/

--Task 8**: Create a virtual table
--Create the "BookingsView" virtual table to print all bookings IDs, bookings dates and the number of guests for bookings made in the restaurant before 2021-11-13 and where number of guests is larger than 3.

CREATE VIEW BookingsView AS
SELECT
BookingID,
BookingDate,
NumberOfGuests
FROM Bookings
WHERE BookingDate < '2021-11-13'
AND NumberOfGuests > 3;

/*
+-----------+-------------+----------------+
| BookingID | BookingDate | NumberOfGuests |
+-----------+-------------+----------------+
|        10 | 2021-11-10  |              5 |
|        13 | 2021-11-11  |              5 |
|        16 | 2021-11-11  |              5 |
+-----------+-------------+----------------+
*/

--Task 9**: Create a stored procedure
--Create a stored procedure called 'GetBookingsData'. The procedure must contain one date parameter called "InputDate". This parameter retrieves all data from the Bookings table based on the user input of the date.
--After executing the query, call the "GetBookingsData" with '2021-11-13' as the input date passed to the stored procedure to show all bookings made on that date.

CREATE PROCEDURE GetBookingData(InputDate DATE)
SELECT *
FROM Bookings
WHERE BookingDate = InputDate;

CALL GetBookingData('2021-11-13');

/*
+-----------+-------------+-------------+----------------+------------+
| BookingID | BookingDate | TableNumber | NumberOfGuests | CustomerID |
+-----------+-------------+-------------+----------------+------------+
|        19 | 2021-11-13  |           7 |              5 |          6 |
+-----------+-------------+-------------+----------------+------------+
*/

--Task 10**: Use the String function

--Create a SQL SELECT query using appropriate MySQL string function to list "Booking Details" including booking ID, booking date and number of guests. The data must be listed in the same format as the following example:
--ID: 10, 
--Date: 2021-11-10, 
--Number of guests: 5

SELECT
CONCAT('ID: ', BookingID,', ', 'Date: ', BookingDate,', ', 'Number of guests: ', NumberOfGuests) AS 'Booking Details'
FROM Bookings; 

/*
+-----------------------------------------------+
| Booking Details                               |
+-----------------------------------------------+
| ID: 10, Date: 2021-11-10, Number of guests: 5 |
| ID: 11, Date: 2021-11-10, Number of guests: 2 |
| ID: 12, Date: 2021-11-10, Number of guests: 2 |
| ID: 13, Date: 2021-11-11, Number of guests: 5 |
| ID: 14, Date: 2021-11-11, Number of guests: 2 |
| ID: 15, Date: 2021-11-11, Number of guests: 2 |
| ID: 16, Date: 2021-11-11, Number of guests: 5 |
| ID: 17, Date: 2021-11-12, Number of guests: 2 |
| ID: 18, Date: 2021-11-12, Number of guests: 2 |
| ID: 19, Date: 2021-11-13, Number of guests: 5 |
| ID: 20, Date: 2021-11-14, Number of guests: 2 |
| ID: 21, Date: 2021-11-14, Number of guests: 2 |
+-----------------------------------------------+
*/

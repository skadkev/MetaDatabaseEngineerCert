--Copying all data from a table:

CREATE TABLE ClientsTest
SELECT *
FROM Clients;

--Copying partial data only:

CREATE TABLE ClientsTest2
SELECT FullName, ContactNumber
FROM Clients
WHERE Location = "Pinal County";

--The above two methods do not copy over key constraints to the new tables from the original table.**

--The below format will copy the key constraints to the new table:

CREATE TABLE ClientsTest3 LIKE Clients;

INSERT INTO ClientsTest3 
SELECT * 
FROM Clients;

--Copying a table from one database to a new database:

CREATE TABLE testDB.ClientsTest
SELECT *
FROM Lucky_Shrub.Cleints;

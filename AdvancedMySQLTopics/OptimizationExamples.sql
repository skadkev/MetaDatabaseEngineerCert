SELECT *
FROM Orders
WHERE DATE_ADD(Date, INTERVAL 30 DAY) = '2023-06-25';

--Sorting through that data to calculate delivery dates using the DATE_ADD function in the WHERE clause places a lot of extra load on the database.

ALTER TABLE Orders 
ADD COLUMN ExpectedDelivery DATE;

--This is the more optimized way.  This way you can scan the newlly added column for values that you're looking for.

SELECT *
FROM Clients
WEHRE FullName LIKE '%Ito';

--MySQL can't make use of an index when there's a leading wildcard.  The solution is to add a new column the the Client table (Step 1):

--Step 1:
ALTER TABLE Clients
ADD COLUMN ReverseFullName VARCHAR(200);

--Step 2: Run an UPDATE statement to reverse the FullName, listing the first name first and the last name second.

UPDATE Clients
SET ReverseFullName = CONCAT(SUBSTRING_INDEX(FullName, ' ', -1), ' ', SUBSTRING_INDEX(FullName, ' ', 1));

--Step 3: Use a CREATE INDEX statement to create an index on the newly created column.

CREATE INDEX IdxReverseFullName ON Clients (ReverseFullName);

--Step 4: You can now make use of the trailing wildcard (%) with the LIKE operator on the reverse full name column to achieve the same result.

SELECT *
FROM Clients
WHERE ReverseFullName LIKE (Ito%');



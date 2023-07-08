EXPLAIN SELECT
ContactNumber
FROM Clients
WHERE FullName = 'Jane Delgado';

--Using the EXPLAIN clause will output data to explain how the database executes the query.
--You can pinpoint potential bottlenecks and sub-optimal queries by reviewing the output.
--The solution to the above sub-optimal query is to create a secondary index.

CREATE INDEX IdxFullName
ON Clients(FullName);

EXPLAIN SELECT
ContactNumber
FROM Clients
WHERE FullName = 'Jane Delgado';

--The output from the above EXPLAIN command will show a much better output after the index has been created.

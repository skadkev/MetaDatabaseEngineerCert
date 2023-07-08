SELECT
CONCAT(AVG(Cost), "(2020)") AS "Average Sale"
FROM Orders
WHERE YEAR(Date) = 2020
UNION SELECT
CONCAT(AVG(Cost), "(2021)")
FROM Orders
WHERE YEAR(Date) = 2021
UNION SELECT
CONCAT(AVG(Cost), "(2022)")
FROM Orders
WHERE YEAR(Date) = 2022;

--The above query can be optimized be creating CTE's:

WITH
Average_Sales_2020 AS (SELECT CONCAT(AVG(Cost), "(2020)") AS "Average Sale" FROM Orders WHERE YEAR(Date) = 2020),
Average_Sales_2021 AS (SELECT CONCAT(AVG(Cost), "(2021)") FROM Orders WHERE YEAR(Date) = 2021),
Average_Sales_2022 AS (SELECT CONCAT(AVG(Cost), "(2022)") FROM Orders WHERE YEAR(Date) = 2022)

SELECT * FROM Average_Sales_2020
UNION
SELECT * FROM Average_Sales_2021
UNION
SELECT * FROM Average_Sales_2022;


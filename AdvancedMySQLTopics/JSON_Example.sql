CREATE TABLE Activity(ActivityID INT PRIMARY KEY, Properties JSON);

INSERT INTO Activity(ActivityId, Properties)
VALUES 
(1, '{"ClientID": "Cl1", "ProductID": "P1", "Order": "True"}),
(2, '{"ClientID": "Cl2", "ProductID": "P4", "Order": "False"}),
(3, '{"ClientID": "Cl5", "ProductID": "P5", "Order": "True"});

SELECT
ActivityID,
$.ClientID,
$.ProductID,
$.Order
FROM Activity;

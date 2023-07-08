DELIMITER //

CREATE FUNCTION GetTotalCost(Cost DECIMAL(5,2))
RETURNS DECIMAL(5,2) DETERMINISTIC
BEGIN 
IF(Cost >= 100 AND Cost <500) THEN SET Cost = Cost - (Cost * 0.1); 
ELSEIF (Cost >=500) THEN SET Cost = Cost - (Cost * 0.2);
END IF;
RETURN (Cost);
END//

--The "DELIMITER //" command is used to compile the whole function as a single compound statement using begin/end keywords.
--This changes the default semicolon delimiter to a double forward slash.**

DELIMITER ; 
--This changes the delimiter back to the semi colon.**

SELECT GetTotalCost(500);

DROP FUNCTION GetTotalCost;


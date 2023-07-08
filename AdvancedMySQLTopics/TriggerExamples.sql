CREATE TRIGGER OrderQtyCheck
BEFORE INSERT
ON Orders FOR EACH ROW
BEGIN
	IF NEW.orderQty < 0 THEN
	SET New.orderQty = 0;
	END IF;
END;

DROP TRIGGER IF EXISTS Lucky_Shrub.OrderQtyCheck;

CREATE TRIGGER LogNewOrderInsert
AFTER INSERT
ON Orders FOR EACH ROW
INSERT INTO Audits VALUES ('AFTER', 'A new order was inserted', 'INSERT');

CREATE TRIGGER AfterDeleteOrder
AFTER DELETE
ON Orders FOR EACH ROW
INSERT INTO Audits
VALUES('AFTER', CONCAT('Order', OLD.OrderID, 'was deleted at', CURRENT_TIME(), 'on', CURRENT_DATE()), 'DELETE');

--Using the NEW modifier:**

CREATE TRIGGER OrderQtyCheck  
  BEFORE INSERT ON Orders  
  FOR EACH ROW  
BEGIN 
  IF NEW.Quantity < 0 THEN  
    SET NEW.Quantity = 0; 
  END IF; 
END;

--Using the OLD modifier:**

CREATE TRIGGER AfterDeleteOrder 
  AFTER DELETE   
  ON Orders FOR EACH ROW 
INSERT INTO Audits VALUES(4,'AFTER',CONCAT('Order ',OLD.OrderID, ' was deleted at ', CURRENT_TIME(), ' on ', CURRENT_DATE()),'DELETE');


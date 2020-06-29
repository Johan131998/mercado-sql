DELIMITER $$
CREATE PROCEDURE makeOrder (orderNumberP INT, orderDateP DATE, requiredDateP DATE,
                                 shippedDateP DATE, statusP VARCHAR(15), commentsP TEXT,
                                 customerNumberP INT, productCodeP VARCHAR(15),
                                 quantityOrderedP INT, priceEachP DECIMAL(10, 2), orderLineNumberP SMALLINT)
BEGIN
    START TRANSACTION;
            INSERT  INTO `orders`(`orderNumber`,`orderDate`,`requiredDate`,`shippedDate`,`status`,`comments`,`customerNumber`)
            VALUES (orderNumberP,orderDateP,requiredDateP,shippedDateP,statusP,commentsP,customerNumberP);

            INSERT  INTO `orderdetails`(`orderNumber`,`productCode`,`quantityOrdered`,`priceEach`,`orderLineNumber`)
            VALUES  (orderNumberP,productCodeP,quantityOrderedP,priceEachP,orderLineNumberP);
END $$
DELIMITER ;

CALL makeOrder(30666, curdate(), curdate(), curdate(), 'CANCELADO', 'New comment',
              363, 'S24_4258', 1000, 269.32, 7)
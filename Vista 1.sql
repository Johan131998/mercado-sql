--Crear una vista que indica cual es el producto más vendido
--(Nombre del producto, nombre de la linea de producto, venta total del producto, utilidad -> paidPrice - buyPrice)
CREATE VIEW Vista1 AS
SELECT products.productName as productName, productlines.productLine as productline, SUM(quantityOrdered * priceEach) as totalP,  SUM(orderdetails.priceEach - products.buyPrice) as utilityP
FROM products, productlines, orderdetails
WHERE products.productCode = orderdetails.productCode AND products.productLine = productlines.productLine
GROUP BY products.productCode
ORDER BY SUM(quantityOrdered) DESC
LIMIT 1;

SELECT * FROM Vista1;





--EXAMPLE

CALL sp_orderProduct(4040, curdate(), curdate(), curdate(), 'recibido', NULL,
              363, 'S18_1749', 20, 150.70, 7)

--TEST
SELECT * FROM orderdetails WHERE orderNumber = 4040;
SELECT * FROM orders WHERE orderNumber = 4040 ;

--PERMISSIONS
GRANT SELECT ON `classicmodels`.* TO 'marc'@'%';
GRANT SELECT, DELETE, UPDATE ON `classicmodels`.* TO 'marc'@'%';
GRANT EXECUTE ON PROCEDURE classicmodels.sp_orderProduct TO 'marc'@'%';
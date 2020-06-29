
--Crear una vista / procedimiento que visualiza cual ha sido el cliente con mayor cantidad de compras (Parametrizar por rango de fecha)
---(Nombre del cliente, Venta total por cliente, numero de diferentes productos que ha adquirido el cliente)


CREATE VIEW vista2 AS
SELECT customers.customerName AS nombreCliente,SUM(orderdetails.quantityOrdered * orderdetails.priceEach) as ventaTotalCliente,
       COUNT(DISTINCT (orderdetails.productCode)) AS productosDiferentes, MIN(orders.orderDate) AS fechaInicio, MAX(orders.orderDate )as fechaFin
FROM customers, orderdetails, orders
WHERE customers.customerNumber = orders.customerNumber AND orders.orderNumber = orderdetails.orderNumber
GROUP BY customers.customerName
ORDER BY productosDiferentes DESC, fechaInicio, fechaFin
LIMIT 1;



DELIMITER //
CREATE PROCEDURE procedimiento_vista2 (fechaInicio DATE, fechaFin DATE)
BEGIN
    START TRANSACTION;
            SELECT * FROM vista2
            WHERE fechaInicio = vista2.fechaInicio AND fechaFin = vista2.fechaFin;

END //
DELIMITER ;

--Ejemplo
CALL procedimiento_vista2 ('2003-01-31', '2005-05-31');

--PERMISSIONS
GRANT SELECT ON `classicmodels`.* TO 'Marc2020'@'%';
GRANT SELECT, DELETE, UPDATE ON `classicmodels`.* TO 'Marc2020'@'%';
GRANT EXECUTE ON PROCEDURE classicmodels.makeOrder TO 'Marc2020'@'%';
GRANT EXECUTE ON PROCEDURE classicmodels.procedimiento_vista2 TO 'Marc2020'@'%';
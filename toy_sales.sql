DROP DATABASE IF EXISTS toy_sales;

CREATE DATABASE IF NOT EXISTS toy_sales;
USE toy_sales;


CREATE TABLE IF NOT EXISTS Employees (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    employee_name VARCHAR(100) NOT NULL  
);

CREATE TABLE IF NOT EXISTS  Toys (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    toy_name VARCHAR(100) NOT NULL,
    brand VARCHAR(100),
    price FLOAT
    );

CREATE TABLE  IF NOT EXISTS Sales (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    toy_id INT NOT NULL,
    employee_id INT NOT NULL,
    sale_date DATE NOT NULL,
    quantity FLOAT NOT NULL,
    CHECK (quantity > 0),
    FOREIGN KEY (toy_id)
         REFERENCES Toys(id)
         ON DELETE CASCADE,
    FOREIGN KEY (employee_id)
         REFERENCES Employees(id)
         ON DELETE CASCADE       
);


INSERT INTO Employees (employee_name) VALUES ('Rob Stevens');
INSERT INTO Employees (employee_name) VALUES ('Jane White');
INSERT INTO Employees (employee_name) VALUES ('Sofia Clark');

INSERT INTO Toys (toy_name, brand, price) VALUES ('Bumblebee', 'Transformers', 14.99);
INSERT INTO Toys (toy_name, brand, price) VALUES ('Optimus Prime', 'Transformers', 19.99);
INSERT INTO Toys (toy_name, brand, price) VALUES ('Lightning McQueen', 'Disney Cars', 23.97);
INSERT INTO Toys (toy_name, brand, price) VALUES ('Ramone', 'Disney Cars', 20.99);
INSERT INTO Toys (toy_name, brand, price) VALUES ('Wonder Woman', 'Barbie', 39.99);
INSERT INTO Toys (toy_name, brand, price) VALUES ('Princess Leia', 'Barbie', 99.99);
INSERT INTO Toys (toy_name, brand, price) VALUES ('Wizard of Oz: Glinda', 'Barbie', 43.95);
INSERT INTO Toys (toy_name, brand, price) VALUES ('Yoda', 'Disney Star Ward', NULL);

INSERT INTO Sales (toy_id, employee_id, sale_date, quantity) VALUES (5, 3, '2020-07-03', 1);
INSERT INTO Sales (toy_id, employee_id, sale_date, quantity) VALUES (1, 1, '2020-07-03', 1);
INSERT INTO Sales (toy_id, employee_id, sale_date, quantity) VALUES (3, 1, '2020-07-03', 1);
INSERT INTO Sales (toy_id, employee_id, sale_date, quantity) VALUES (6, 3, '2020-07-03', 1);
INSERT INTO Sales (toy_id, employee_id, sale_date, quantity) VALUES (2, 3, '2020-07-03', 1);




UPDATE Employees
SET employee_name = concat(employee_name, '@example.com');

DROP PROCEDURE IF EXISTS printNumbers;


DELIMITER //
CREATE PROCEDURE printNumbers()
BEGIN
    DECLARE num INT;
    SET num = 0;
    lab: LOOP
        SET num = num + 1;
        SELECT num;
        IF num > 6 THEN
            LEAVE lab;
        END IF;  
    END LOOP lab;
    SELECT num;
END//
DELIMITER ;

DROP view IF EXISTS vToy_sales;
CREATE view vToy_sales AS
SELECT employee_name, toy_name, brand, price, quantity, sale_date
FROM Toys
INNER JOIN Sales
ON Sales.toy_id=Toys.id
INNER JOIN Employees
ON Employees.id=Sales.employee_id;

SELECT * FROM vToy_sales;

create view vSalesByBrands as
select brand,
    sum(quantity) as total_quantity_sold,
    round(sum(quantity * price), 2) as total_sales_dollars
from Toys
    inner join Sales on Toys.id = Sales.toy_id
group by brand;

select * from vSalesByBrands;

create view vLastMonthsales as
select *
from Sales
where Month(sale_date) = (
        select month(max(sale_date))
        from Sales
    );

select * from vLastMonthsales;


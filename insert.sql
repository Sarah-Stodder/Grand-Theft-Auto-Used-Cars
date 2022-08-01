
--Create User Function-----------
SELECT addCustomer('Casper', 'The Ghost');
SELECT addCustomer('Buzz', 'Lightyear');
SELECT addCustomer('Matt', 'Maeson');
SELECT addCustomer('Al', 'Lewis');

SELECT *
FROM customer;
------------salesperson
INSERT INTO salesperson(first_name, last_name) VALUES
('Bob','Belcher'),
('Ru','Paul'),
('John','Bonjovi')

SELECT *
FROM salesperson;

-------mechanic------

INSERT INTO mechanic(first_name, last_name) VALUES
('Montgomery','Scott'),
('Brian','OConner'),
('Carroll', 'Shelby')

SELECT *
From mechanic;

------------sales_car---------------

INSERT INTO sales_car(vin, make, model,price) VALUES
('083947g637289k082','Volkswagen','Beetle',24990.00),
('0987346h65389j273', 'Dodge', 'Challanger R/T', 41563.99)


INSERT INTO sales_car(vin, make, model,price,sold) VALUES
('07190h94s67817g62','Internatinal Harvester','Scout',34990.00, FALSE)


SELECT *
FROM sales_car;

-------Invoice------
INSERT INTO invoice(customer_id, car_id, salesperson_id) VALUES
(3, 2, 1),
(1, 1, 3)

SELECT *
FROM invoice;

-----------customer_car---------
INSERT INTO customer_car(vin, year, make, model, customer_id) VALUES
('1728394h64f372j87', '1966', 'Ford', 'Dragula',4),
('083947g637289k082', '2019', 'Volkswagon', 'Beetle',1),
('0987346h65389j273', '2021', 'Dodge', 'Challanger R/T',3),
('890627364b3289s90', '1999', 'Gyoza','Lite Hauler',2)

SELECT *
FROM customer_car;

---------------part--------------
INSERT INTO part(part_name, quantity, part_price) VALUES
('air filter', 66, 13.99),
('spark plug(4)', 200, 14.99),
('alternator', 50, 110.89),
('oil filter', 1000, 15.98),
('battery', 80, 200.00)



SELECT * 
FROM part;

---------"service"-------------------
INSERT INTO "service"("service_name", price, mechanic_id) VALUES
('Oil Change', 49.50, 2),
('Alternator Replace', 275.00, 1),
('spark plug replace', 30.00, 2),
('Full detail', 100.00, 3),
('Dent repair', 50.00, 3)



SELECT * 
FROM "service";

--------------service_ticket Function-----------------
SELECT addServiceTicket(49.50, '890627364b3289s90',1,4);
SELECT addServiceTicket(300.00, '890627364b3289s90',4,5);
SELECT addServiceTicket(200.00, '1728394h64f372j87',NULL, 5);




SELECT * 
FROM service_ticket;

--------------------------history-------------
INSERT INTO history(vin, service_ticket_id) VALUES
('890627364b3289s90',2),
('890627364b3289s90', 3),
('1728394h64f372j87', 5)


SELECT * 
FROM history;

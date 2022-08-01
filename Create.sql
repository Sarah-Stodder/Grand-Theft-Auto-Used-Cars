DROP TABLE IF EXISTS customer CASCADE;
CREATE TABLE customer (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

DROP TABLE IF EXISTS salesperson CASCADE;
CREATE TABLE salesperson (
    salesperson_id SERIAL PRIMARY KEY,
    first_name VARCHAR (50),
    last_name VARCHAR (50)
);

DROP TABLE IF EXISTS mechanic CASCADE;
CREATE TABLE mechanic (
    mechanic_id SERIAL PRIMARY KEY,
    first_name VARCHAR (50),
    last_name VARCHAR (50)
);

DROP TABLE IF EXISTS sales_car CASCADE;
CREATE TABLE sales_car (
    car_id SERIAL PRIMARY KEY,
    vin  VARCHAR(17),
    make VARCHAR (50),
    model VARCHAR (50),
    price DECIMAL (10,2)
    
);

-- I realized that I wanted to add a sold key to the sales car table
ALTER TABLE sales_car
ADD COLUMN sold BOOLEAN;

UPDATE sales_car
SET sold = TRUE
WHERE car_id = 1;

UPDATE sales_car
SET sold = TRUE
WHERE car_id = 2;



DROP TABLE IF EXISTS invoice CASCADE;
CREATE TABLE invoice (
    invoice_id SERIAL PRIMARY KEY,
    customer_id INTEGER,
    car_id INTEGER,
    salesperson_id INTEGER,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id) ON DELETE CASCADE,
    FOREIGN KEY (car_id) REFERENCES sales_car(car_id) ON DELETE CASCADE,
    FOREIGN KEY (salesperson_id) REFERENCES salesperson(salesperson_id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS customer_car CASCADE;
CREATE TABLE customer_car (
    vin VARCHAR(17) PRIMARY KEY,
    year VARCHAR(4),
    make VARCHAR(50),
    model VARCHAR(50),
    customer_id INTEGER,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS part CASCADE;
CREATE TABLE part (
    part_id SERIAL PRIMARY KEY,
    part_name VARCHAR(50),
    quantity VARCHAR(5),
    part_price DECIMAL(10,2)
);

DROP TABLE IF EXISTS "service" CASCADE;
CREATE TABLE "service"(
    service_id SERIAL PRIMARY KEY,
    "service_name" VARCHAR(100),
    price DECIMAL(10,2),
    mechanic_id INTEGER,
    FOREIGN KEY (mechanic_id) REFERENCES mechanic(mechanic_id) ON DELETE CASCADE

);
DROP TABLE IF EXISTS service_ticket CASCADE;
CREATE TABLE service_ticket(
    service_ticket_id SERIAL PRIMARY KEY,
    total_cost DECIMAL(10,2),
    vin VARCHAR(17),
    service_id INTEGER,
    part_id INTEGER,
    FOREIGN KEY (vin) REFERENCES customer_car(vin) ON DELETE CASCADE,
    FOREIGN KEY (service_id) REFERENCES "service"(service_id) ON DELETE CASCADE,
    FOREIGN KEY (part_id) REFERENCES part(part_id) ON DELETE CASCADE
);
DROP TABLE IF EXISTS history CASCADE;
CREATE TABLE history(
    vin VARCHAR(17),
    service_ticket_id INTEGER,
    FOREIGN KEY (vin) REFERENCES customer_car(vin) ON DELETE CASCADE,
    FOREIGN KEY (service_ticket_id) REFERENCES service_ticket(service_ticket_id) ON DELETE CASCADE
);





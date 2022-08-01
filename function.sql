CREATE OR REPLACE FUNCTION addCustomer
    (
        _first_name varchar(50),
        _last_name varchar(50)
    )
RETURNS VOID
LANGUAGE plpgsql 
AS
$$
BEGIN
    INSERT INTO customer (
        first_name,
        last_name
    ) VALUES (
        _first_name,
        _last_name
    );
END;
$$




CREATE OR REPLACE FUNCTION addServiceTicket
    (
        _total_cost DECIMAL (10,2), 
		_vin VARCHAR(17), 
		_service_id NULL, 
		_part_id NULL
    )
RETURNS VOID 
LANGUAGE plpgsql 
AS 
$$
BEGIN
    INSERT INTO service_ticket (
		total_cost, 
		vin, 
		service_id,
        part_id,
    ) VALUES 
        _total_cost, 
		_vin, 
		_service_id, 
		_part_id
    );
END;
$$


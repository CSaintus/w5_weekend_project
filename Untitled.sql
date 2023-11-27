CREATE TABLE salesperson (
  salesperson_id PRIMARY KEY SERIAL,
  first_name VARCHAR(20),
  last_name VARCHAR(20),
  salesperson_code VARCHAR(10)
);


CREATE TABLE customer (
  customer_id PRIMARY KEY SERIAL,
  first_name VARCHAR(20),
  last_name VARCHAR(20),
  phone VARCHAR(20),
  email VARCHAR(50),
  address VARCHAR(100)
);


CREATE TABLE service (
  service_id PRIMARY KEY SERIAL,
  customer_id INT REFERENCES customer(customer_id)
  description VARCHAR(600) 
);


CREATE TABLE mechanic (
  mechanic_id PRIMARY KEY SERIAL,
  first_name VARCHAR(20),
  last_name VARCHAR(20),
  mechanic_code VARCHAR(20)
);


CREATE TABLE car (
  car_id PRIMARY KEY SERIAL,
  salesperson_id INT REFERENCES salesperson(salesperson_id),
  customer_id INT REFERENCES customer(customer_id),
  service_id INT REFERENCES service(service_id),
  mechanic_id INT REFERENCES "mechanic"("mechanic_id"),
  make VARCHAR(20),
  model VARCHAR(20),
  car_year NUMERIC,
  vin VARCHAR(20),
  price DECIMAL(6,2)
);


CREATE TABLE invoice (
  invoice_id PRIMARY KEY SERIAL,
  salesperson_id INT REFERENCES salesperson(salesperson_id),
  customer_id INT  REFERENCES customer(customer_id),
  invoice_date DATE,
  sub-total DECIMAL(6,2),
  total_price DECIMAL(6,2),
);


CREATE TABLE part (
  part_id PRIMARY KEY SERIAL,
  service_id INT REFERENCES service(service_id)
  part_name VARCHAR(50),
  price DECIMAL(6,2), 
);


/*Queries for creating and populating the table with raw data from the csv file*/
CREATE SCHEMA raw_data;

CREATE TABLE raw_data.sales (
    id SMALLINT PRIMARY KEY,
    auto VARCHAR,
    gasoline_consumption NUMERIC,
    price NUMERIC,
    date DATE,
    person_name VARCHAR,
    phone VARCHAR,
    discount SMALLINT,
    brand_origin VARCHAR
);

\copy raw_data.sales(id, auto, gasoline_consumption, price, date, person_name, phone, discount, brand_origin) FROM 'C:\Temp\cars.csv' CSV HEADER NULL 'null';

/*Queries for creating the car_shop schema and tables in this schema*/
DROP SCHEMA IF EXISTS car_shop CASCADE;

CREATE SCHEMA car_shop;

CREATE TABLE car_shop.clients (
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL,
    phone VARCHAR NOT NULL,
    UNIQUE (name, phone)
   );

CREATE TABLE car_shop.countries (
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL UNIQUE
);

CREATE TABLE car_shop.colors (
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL UNIQUE
);

CREATE TABLE car_shop.autos (
    id SERIAL PRIMARY KEY,
    brand_name VARCHAR NOT NULL,
    model_name VARCHAR NOT NULL,
    gasoline_consumption NUMERIC(3, 1),
    country_id INTEGER REFERENCES car_shop.countries(id),
    UNIQUE (brand_name, model_name)
);

CREATE TABLE car_shop.autos_colors (
    auto_id INTEGER REFERENCES car_shop.autos(id) NOT NULL,
    color_id INTEGER REFERENCES car_shop.colors(id) NOT NULL,
    PRIMARY KEY(auto_id, color_id)
);

CREATE TABLE car_shop.sales (
    id SERIAL PRIMARY KEY,
    price NUMERIC(9, 2) NOT NULL,
    date DATE NOT NULL,
    discount SMALLINT,
    auto_id INTEGER REFERENCES car_shop.autos(id) NOT NULL,
    client_id INTEGER REFERENCES car_shop.clients(id) NOT NULL
);

/*Queries for creating the car_shop schema and tables in this schema*/
DROP SCHEMA IF EXISTS car_shop CASCADE;

CREATE SCHEMA car_shop;

CREATE TABLE car_shop.clients (
    id SERIAL PRIMARY KEY, /*Автоинкремент для автоматического увеличения и присваивания значений id (PK).*/
    name VARCHAR NOT NULL, /*Так как имя — это строка переменной длины.*/
    phone VARCHAR NOT NULL, /*Телефон может содержать цифры, дефисы, скобки и т.д.*/
    UNIQUE (name, phone)
   );

CREATE TABLE car_shop.countries (
    id SERIAL PRIMARY KEY, /*Автоинкремент для автоматического увеличения и присваивания значений id (PK).*/
    name VARCHAR NOT NULL UNIQUE /*Название страны — это строка переменной длины.*/
);

CREATE TABLE car_shop.colors (
    id SERIAL PRIMARY KEY, /*Автоинкремент для автоматического увеличения и присваивания значений id (PK).*/
    name VARCHAR NOT NULL UNIQUE /*Название цвета — это срока переменной длины.*/
);

CREATE TABLE car_shop.autos (
    id SERIAL PRIMARY KEY, /*Автоинкремент для автоматического увеличения и присваивания значений id (PK).*/
    brand_name VARCHAR NOT NULL, /*Строка переменной длины, которая состоит из букв.*/
    model_name VARCHAR NOT NULL, /*Строка переменной длины, которая может состоять из букв и цифр.*/
    gasoline_consumption NUMERIC(3, 1), /*По условию потребление бензина не может быть трёхзначным числом, 
    и дробная часть содержит не более 1 разряда. Так же numeric используется, когда необходима повышенная 
    точность, чтоб быть увереннным, что при операциях дробные числа не потеряются.*/
    country_id INTEGER REFERENCES car_shop.countries(id), /*INTEGER для согласования с первичным ключом.*/
    UNIQUE (brand_name, model_name)
);

CREATE TABLE car_shop.autos_colors (
    auto_id INTEGER REFERENCES car_shop.autos(id) NOT NULL, /*INTEGER для согласования с первичным ключом.*/
    color_id INTEGER REFERENCES car_shop.colors(id) NOT NULL, /*INTEGER для согласования с первичным ключом.*/
    PRIMARY KEY(auto_id, color_id)
);

CREATE TABLE car_shop.sales (
    id SERIAL PRIMARY KEY, /*Автоинкремент для автоматического увеличения и присваивания значений id (PK).*/
    price NUMERIC(9, 2) NOT NULL, /*цена может содержать только сотые (центы) и не может быть больше 
    семизначной суммы (по условию). У данного типа повышенная точность, что и требуется при работе 
    с денежными значениями.*/
    date DATE NOT NULL, /*Тип date для даты покупки.*/
    discount SMALLINT, /*Наименьший целочисленный тип (значения от -32 768 до +32 767), так как скидка находится в диапазоне от 0 до 100.*/
    auto_id INTEGER REFERENCES car_shop.autos(id) NOT NULL, /*INTEGER для согласования с первичным ключом.*/
    client_id INTEGER REFERENCES car_shop.clients(id) NOT NULL /*INTEGER для согласования с первичным ключом.*/
);

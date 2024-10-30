/*Queries that populate tables in the car_shop schema with data.*/
INSERT INTO car_shop.colors (name)
SELECT DISTINCT SPLIT_PART(s.auto, ', ', -1)
FROM raw_data.sales s;

INSERT INTO car_shop.clients (name, phone)
SELECT DISTINCT s.person_name, s.phone 
FROM raw_data.sales s;

INSERT INTO car_shop.countries (name)
SELECT DISTINCT s.brand_origin
FROM raw_data.sales s
WHERE s.brand_origin IS NOT NULL;

INSERT INTO car_shop.autos (brand_name, model_name, gasoline_consumption, country_id)
SELECT DISTINCT 
    SPLIT_PART(SPLIT_PART(s.auto, ',', 1), ' ', 1),
    SUBSTR(SPLIT_PART(s.auto, ',', 1), STRPOS(SPLIT_PART(s.auto, ',', 1), ' ') + 1),
    s.gasoline_consumption,
    c.id
FROM raw_data.sales s
LEFT JOIN car_shop.countries c ON c.name = s.brand_origin;

INSERT INTO car_shop.autos_colors (auto_id, color_id)
SELECT DISTINCT a.id, c.id 
FROM raw_data.sales s
LEFT JOIN car_shop.autos a ON s.auto LIKE (a.brand_name || ' ' || a.model_name || '%')
LEFT JOIN car_shop.colors c ON s.auto LIKE ('%' || c.name);

INSERT INTO car_shop.sales (price, date, discount, auto_id, client_id)
SELECT DISTINCT s.price, s.date, s.discount, a.id, c.id
FROM raw_data.sales s
LEFT JOIN car_shop.autos a ON s.auto LIKE (a.brand_name || ' ' || a.model_name || '%')
LEFT JOIN car_shop.clients c ON c.name = s.person_name AND c.phone = s.phone;




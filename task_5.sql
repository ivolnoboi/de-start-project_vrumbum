/*The highest and the lowest price by country.*/
SELECT 
    c.name AS brand_origin, 
    MAX(s.price * 100 / (100 - discount)) AS price_max, 
    MIN(s.price * 100 / (100 - discount)) AS price_min
FROM car_shop.countries c 
LEFT JOIN car_shop.autos a ON c.id = a.country_id 
LEFT JOIN car_shop.sales s ON a.id = s.auto_id
GROUP BY c.name;
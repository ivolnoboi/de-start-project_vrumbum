/*List of purchased cars for each user.*/
SELECT c.name, string_agg(a.brand_name || ' ' || a.model_name, ', ') AS cars
FROM car_shop.clients c 
LEFT JOIN car_shop.sales s ON c.id = s.client_id
LEFT JOIN car_shop.autos a ON a.id = s.auto_id
GROUP BY c.name
ORDER BY c.name;

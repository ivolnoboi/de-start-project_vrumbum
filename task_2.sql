/*Average price of cars by year.*/
SELECT 
    a.brand_name, 
    EXTRACT('Year' FROM s.date) AS year, 
    ROUND(AVG(s.price), 2) AS price_avg
FROM car_shop.sales s
JOIN car_shop.autos a ON s.auto_id = a.id
GROUP BY a.brand_name, EXTRACT('Year' FROM s.date)
ORDER BY a.brand_name, EXTRACT('Year' FROM s.date);
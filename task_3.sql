/*Average price of all cars by month in 2022.*/
SELECT
    EXTRACT('Month' FROM s.date) AS month, 
    2022 AS YEAR,
    ROUND(AVG(s.price), 2) AS price_avg
FROM car_shop.sales s
WHERE EXTRACT('Year' FROM s.date) = 2022
GROUP BY 1
ORDER BY 1;

/*Percentage of electric vehicles in the table.*/
SELECT (1 - count(gasoline_consumption)::real / count(*)) * 100 AS nulls_percentage_gasoline_consumption
FROM car_shop.autos;

/*Amount of users from the USA.*/
SELECT COUNT(*) AS persons_from_usa_count
FROM car_shop.clients
WHERE phone LIKE '+1%';

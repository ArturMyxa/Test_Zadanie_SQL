--актуальные данные товаров на 2020-06-01
SELECT i.item_id, i.name, i.price
FROM items i
WHERE i.update_date = (
    SELECT MAX(update_date)
    FROM items
    WHERE update_date <= '2020-06-01' AND item_id = i.item_id
);



--Tовары, купленные по цене больше или равно чем 3
SELECT DISTINCT i.item_id, i.name, i.price
FROM items i
JOIN orders o ON i.item_id = o.item_id
WHERE i.price >= 3;



--Суммf покупок клиента 1

SELECT SUM(i.price) AS total_spent
FROM orders o
JOIN items i ON o.item_id = i.item_id
WHERE o.user_id = 1;



--Сумма всех покупок до 2020-05-01 включительно

SELECT SUM(i.price) AS total_spent
FROM orders o
JOIN items i ON o.item_id = i.item_id
WHERE o.order_date <= '2020-05-01';


--Сумму всех заказов и среднее цена заказа поквартально

SELECT
    DATE_TRUNC('quarter', o.order_date) AS quarter,
    SUM(i.price) AS total_sum,
    AVG(i.price) AS average_price
FROM orders o
JOIN items i ON o.item_id = i.item_id
GROUP BY quarter
ORDER BY quarter;


/*Для оптимизации запросов можно выполнить следующие действия:

Создание индексов:

индексы на колонках, которые часто используются в запросах.
Например, на item_id, user_id, order_date, update_date.


CREATE INDEX idx_item_id ON items(item_id);
CREATE INDEX idx_user_id ON orders(user_id);
CREATE INDEX idx_order_date ON orders(order_date);
CREATE INDEX idx_update_date ON items(update_date);



Использование EXPLAIN:

Для анализа выполнения запросов использовать команду EXPLAIN перед запросом.
EXPLAIN SELECT ...



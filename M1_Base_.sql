-- Удаляем таблицы, если они уже есть (чтобы пересоздать с нуля)
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS items;

-- 1. Создаем таблицу items
CREATE TABLE items (
    item_id INT,
    name VARCHAR(30),
    price DECIMAL,
    update_date DATE,
    PRIMARY KEY (item_id, update_date)
);

-- 2. Вставляем данные
INSERT INTO items (item_id, name, price, update_date) VALUES
(1, 'Ручка гелевая', 10, '2020-02-01'),
(2, 'Карандаш 1HH', 2, '2020-01-01'),
(1, 'Ручка шариковая', 10, '2020-03-01'),
(3, 'Ластик', 5, '2020-07-01'),
(2, 'Карандаш 1HH', 3, '2020-05-01'),
(1, 'Ручка шариковая', 5, '2020-05-01'),
(2, 'Карандаш 1H', 7, '2020-06-01');

-- 3. Создаем таблицу orders 
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    item_id INT,
    order_date DATE
);

-- 4. Вставляем данные в orders
INSERT INTO orders (order_id, user_id, item_id, order_date) VALUES
(1, 1, 1, '2020-02-01'),
(2, 2, 2, '2020-02-01'),
(3, 1, 3, '2020-07-01'),
(4, 3, 2, '2020-07-01'),
(5, 2, 1, '2020-04-01'),
(6, 1, 1, '2020-06-01');


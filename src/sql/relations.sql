-- ONE TO ONE
SELECT p.name, a.name AS address_name
FROM persons p, address a
WHERE p.address_id = a.id;

-- ONE TO MANY/MANY TO ONE
SELECT p.name, o.name AS order_name
FROM persons p, orders o
WHERE o.person_id = p.id;

-- MANY TO MANY
SELECT i.name AS item_name, o.name AS order_name
FROM items i, orders o, orders_items io
WHERE o.id = io.order_id
AND i.id = io.item_id;


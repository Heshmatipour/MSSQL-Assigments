SELECT E.customer_id, E.first_name, E.last_name,
ISNULL(NULLIF(ISNULL(STR(F.customer_id), 'No'), STR(F.customer_id)), 'Yes') First_Product,
ISNULL(NULLIF(ISNULL(STR(G.customer_id), 'No'), STR(G.customer_id)), 'Yes') Second_Product,
ISNULL(NULLIF(ISNULL(STR(H.customer_id), 'No'), STR(H.customer_id)), 'Yes') Third_Product
FROM (
SELECT DISTINCT D.customer_id, D.first_name, D.last_name
FROM product.product A, sale.order_item B, sale.orders C, sale.customer D
WHERE A.product_id = B.product_id
AND b.order_id = c.order_id
AND C.customer_id = D.customer_id
AND product_name = '2TB Red 5400 rpm SATA III 3.5 Internal NAS HDD') E
LEFT JOIN (
SELECT DISTINCT D.customer_id, D.first_name, D.last_name
FROM product.product A, sale.order_item B, sale.orders C, sale.customer D
WHERE A.product_id = B.product_id
AND b.order_id = c.order_id
AND C.customer_id = D.customer_id
AND product_name = 'Polk Audio - 50 W Woofer - Black') F ON E.customer_id = F.customer_id
LEFT JOIN (
SELECT DISTINCT D.customer_id, D.first_name, D.last_name
FROM product.product A, sale.order_item B, sale.orders C, sale.customer D
WHERE A.product_id = B.product_id
AND b.order_id = c.order_id
AND C.customer_id = D.customer_id
AND product_name = 'SB-2000 12 500W Subwoofer (Piano Gloss Black)') G ON E.customer_id = G.customer_id
LEFT JOIN (
SELECT DISTINCT D.customer_id, D.first_name, D.last_name
FROM product.product A, sale.order_item B, sale.orders C, sale.customer D
WHERE A.product_id = B.product_id
AND b.order_id = c.order_id
AND C.customer_id = D.customer_id
AND product_name = 'Virtually Invisible 891 In-Wall Speakers (Pair)') H ON E.customer_id = H.customer_id
ORDER BY 1
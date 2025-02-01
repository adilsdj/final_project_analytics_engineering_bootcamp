SELECT
    CONCAT(order_id,'_',item_id) AS order_item_id,
    order_id,
    item_id AS order_line,
    product_id,
    quantity,
    list_price,
    discount AS discount_rate,
    (list_price * quantity) * (1 - discount) AS line_price_after_discount
FROM 
    {{source("localbike","order_items")}}
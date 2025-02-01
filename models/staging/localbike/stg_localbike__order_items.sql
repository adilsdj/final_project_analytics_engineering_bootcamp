SELECT
    CONCAT(order_id,'_',item_id) AS order_item_id,
    order_id,
    item_id AS order_line,
    product_id,
    quantity,
    list_price,
    discount AS discount_rate
FROM 
    {{source("localbike","order_items")}}
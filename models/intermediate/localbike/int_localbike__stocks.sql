SELECT
    stock_id,
    store_id,
    product_id,
    quantity
FROM 
    {{ref("stg_localbike__stocks")}}
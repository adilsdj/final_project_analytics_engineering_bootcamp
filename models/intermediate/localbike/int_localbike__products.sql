SELECT
    p.product_id,
    p.product_name,
    b.brand_id,
    c.category_id,
    p.model_year,
    p.list_price
FROM
    {{ref("stg_localbike__products")}} p
LEFT JOIN 
    {{ref("stg_localbike__product_brands")}} b
    USING(brand_id)
LEFT JOIN
    {{ref("stg_localbike__product_categories")}} c
    USING(category_id)
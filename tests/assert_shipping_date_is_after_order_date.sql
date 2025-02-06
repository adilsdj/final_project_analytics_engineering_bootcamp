SELECT
    order_id
FROM
    ref("stg_localbike__orders")
WHERE
    shipped_date IS NOT NULL
    AND shipped_date < order_date
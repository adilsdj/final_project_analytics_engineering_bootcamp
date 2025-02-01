SELECT
    order_id
FROM
    ref("stg_localbike__orders")
WHERE
    required_date < order_date
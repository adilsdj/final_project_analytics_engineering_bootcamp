SELECT
    discount_rate
FROM
    {{ref('stg_localbike__order_items')}}
WHERE
    discount_rate NOT BETWEEN 0 AND 1
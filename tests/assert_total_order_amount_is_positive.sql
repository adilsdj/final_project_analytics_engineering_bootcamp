SELECT
    order_id,
    SUM(line_price_after_discount) AS order_total_amount
FROM
    {{ref("stg_localbike__order_items")}}
GROUP BY
    order_id
HAVING order_total_amount < 0

WITH order_items_grouped_by_order AS (
    SELECT
        o.order_id,
        o.customer_id,
        store_id,
        staff_id,
        o.order_status,
        o.order_date,
        o.required_date,
        o.shipped_date,
        SUM(oi.line_price_after_discount) AS total_order_amount,
        SUM(oi.quantity) AS total_items,
        COUNT(DISTINCT(oi.product_id)) AS total_distinct_items,
    FROM
        {{ref("stg_localbike__order_items")}} oi
    INNER JOIN
        {{ref("stg_localbike__orders")}} o
    USING(order_id)
    GROUP BY
        order_id,
        customer_id,
        store_id,
        staff_id,
        order_status,
        order_date,
        required_date,
        shipped_date
)

SELECT
    oig.order_id,
    oig.customer_id,
    c.city AS customer_city,
    c.state AS customer_state,
    oig.order_status,
    oig.order_date,
    oig.required_date,
    oig.shipped_date,
    oig.store_id,
    oig.staff_id,
    oig.total_order_amount,
    oig.total_items,
    oig.total_distinct_items
FROM
    order_items_grouped_by_order oig
LEFT JOIN
    {{ref("stg_localbike__customers")}} c
    USING(customer_id)
LEFT JOIN
    {{ref("stg_localbike__stores")}} s
    USING(store_id)





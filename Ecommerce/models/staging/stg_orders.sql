with src_orders as (
    SELECT * FROM {{source('Ecommerce', 'r_orders')}}
)

SELECT 
    order_id,
    customer_id,
    order_status,
    order_purchase_timestamp purchased_date,
    order_approved_at approved_date,
    order_delivered_carrier_date carrier_delivery_date,
    order_delivered_customer_date delivery_date,
    order_estimated_delivery_date estimated_delivery_date
FROM src_orders
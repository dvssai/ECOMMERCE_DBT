with src_orders as (
    Select * from {{ref('stg_orders')}}
),
src_order_items as (
    Select * from {{ref('stg_order_items')}}
)

Select o.order_id,o.order_status,o.purchased_date,o.delivery_date,o.estimated_delivery_date,product_id,price,oi.order_item_id,
seller_id,freight_value,shipping_limit_date
from src_orders o Join src_order_items oi
on o.order_id = oi.order_id
with src_order_items as (
    SELECT  * 
    FROM {{source('Ecommerce', 'r_order_items')}}
)

SELECT
    TRIM(REPLACE(order_id,'"','')) as order_id,
    order_item_id,
    TRIM(REPLACE(product_id,'"','')) as product_id,
    TRIM(REPLACE(SELLER_ID,'"','')) as Seller_id,
    Shipping_limit_date,
    price,
    freight_value
FROM src_order_items
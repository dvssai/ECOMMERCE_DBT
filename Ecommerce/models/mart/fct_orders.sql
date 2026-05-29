with fct_orders as (
        Select * from {{ref('Int_orders')}}
)
Select order_id,Customer_id as Customerid,
order_status,
purchased_date,
delivery_date,
estimated_delivery_date,
product_id,price,
order_item_id,
seller_id,freight_value,shipping_limit_date,
CASE
    WHEN DATE(estimated_delivery_date) <= DATE(delivery_date) THEN 'Late'
    ELSE 'On Time'
END AS is_delivered
from fct_orders
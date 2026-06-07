with fct_orders as (
        Select p.product_id as product_id,
        order_id,
        Customer_id,
        order_status,
        purchased_date,
        delivery_date,
        estimated_delivery_date,
        price,
        order_item_id,
        seller_id,
        freight_value,shipping_limit_date
         from {{ref('Int_orders')}} O RIGHT JOIN {{ref('dim_products')}} P
        on O.product_id = P.product_id
)
Select order_id,Customer_id as Customerid,
order_status,
purchased_date as purchase_tp,
delivery_date as delivery_tp,
estimated_delivery_date as estimated_delivery_tp,
CAST(left(purchased_date,10) as DATE) as purchase_dt,
CAST(left(delivery_date,10) as DATE) as delivery_dt,
CAST(left(estimated_delivery_date,10) as DATE)  as estimated_delivery_dt,
product_id,price,
order_item_id,
seller_id,freight_value,shipping_limit_date,
CASE
    WHEN DATE(estimated_delivery_date) <= DATE(delivery_date) THEN 'Late'
    ELSE 'On Time'
END AS is_delivered
from fct_orders
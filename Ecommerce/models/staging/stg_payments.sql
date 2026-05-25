with src_payments as(
    SELECT * FROM {{source('Ecommerce', 'r_payments')}}
)

SELECT TRIM(REPLACE(ORDER_ID,'"','')) AS ORDER_ID,
       payment_sequential,
       payment_type,
       payment_installments,
       payment_value
from src_payments
with src_payments as (
    Select * from {{ref('stg_payments')}}
)

Select order_id,payment_type,payment_sequential
payment_installments,payment_value
from src_payments
Where (order_id is not null) and (payment_type is not null) AND (payment_installments > 0) AND payment_type <> 'not_defined'
qualify row_number() over (partition by order_id,payment_type order by order_id) = 1
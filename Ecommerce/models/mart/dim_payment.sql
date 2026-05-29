with dim_payment as (
    Select * from {{ref('Int_payments')}}
)   
Select order_id,payment_type,payment_installments,payment_value
from dim_payment
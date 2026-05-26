with src_int_customers as (
    Select * from {{ref('stg_customers')}}
)

Select 
customer_id as CustomerID,
customer_unique_id as CustomerUniqueID,
zip_code as ZipCode,
city as City,updated_at
from src_int_customers
Where customer_id is not null and customer_unique_id is not null
qualify row_number() over (partition by customer_id,customer_unique_id order by customer_id) = 1
With src_customers as (
    select * from {{ source('Ecommerce', 'r_customers') }}
)

select
        trim(replace(customer_id,'"', '')) as customer_id,
        trim(replace(customer_unique_id, '"', '')) as customer_unique_id,
        trim(replace(zip_code, '"', '')) as zip_code,
        city,state,updated_at             
    from src_customers
    where customer_id is not null AND customer_unique_id is not null
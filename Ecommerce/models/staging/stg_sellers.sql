with src_sellers as (
    select * from {{source('Ecommerce', 'r_sellers')}}
)

Select seller_id,seller_zip_code_prefix as zipcode, seller_city, seller_state
from src_sellers
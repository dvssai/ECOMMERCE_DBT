with src_prd_translation as (
    select * FROM {{source('Ecommerce','r_product_translation')}}
)

SELECT 
product_category_name,
product_category_name_english,updated_at
FROM src_prd_translation
with src_products as (
    SELECT  * 
    FROM {{source('Ecommerce', 'r_products')}}
)

SELECT TRIM(REPLACE(p.product_id, '"', '')) as product_id,product_category_name,
p.product_weight_g as product_weight,p.updated_at updated_at
FROM src_products p
WHERE p.product_id IS NOT NULL
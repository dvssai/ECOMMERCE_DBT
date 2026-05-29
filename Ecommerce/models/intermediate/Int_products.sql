with src_products as(
    Select * from {{ref('stg_products')}}
),
src_product_translations as(
    Select * from {{ref('stg_product_translation')}}
)


Select p.product_id as product_id,pt.PRODUCT_CATEGORY_NAME_ENGLISH as product_category_name_english,
p.PRODUCT_CATEGORY_NAME as product_category_name,product_weight
from src_products p join src_product_translations pt
on p.PRODUCT_CATEGORY_NAME = pt.PRODUCT_CATEGORY_NAME
Where (p.product_id is not null) and (pt.PRODUCT_CATEGORY_NAME_ENGLISH is not null) AND (p.PRODUCT_CATEGORY_NAME is not null) AND 
(p.product_weight > 0)
qualify row_number() over (partition by p.product_id, pt.PRODUCT_CATEGORY_NAME_ENGLISH, p.PRODUCT_CATEGORY_NAME order by p.product_id) = 1
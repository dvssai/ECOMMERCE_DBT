with src_reviews as(
    Select * from {{ref('stg_reviews')}}
)
Select review_id,order_id,review_score,
review_comment_title as title,review_comment_message as comment,
review_creation_date as review_date,review_answer_timestamp as response_date
from src_reviews
where review_id is not null and order_id is not null
qualify row_number() over (partition by review_id,order_id order by review_id) = 1
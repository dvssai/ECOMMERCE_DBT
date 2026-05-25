with src_reviews as (
    select * from {{source('Ecommerce', 'r_reviews')}}
)

SELECT 
review_id,order_id,review_score,review_comment_title,review_comment_message,review_creation_date,review_answer_timestamp
FROM src_reviews
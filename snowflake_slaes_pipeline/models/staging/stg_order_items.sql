SELECT  id AS ordItem_id , 
        order_id ,
        product_id ,
        quantity , 
        unit_price ,
        quantity * unit_price AS total_amount 
FROM {{ source('raw_data' , 'order_items')}}

{% if var('is_test_run' , default=true) %}

limit 20

{% endif %}
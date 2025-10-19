SELECT  ID AS order_id , 
        customer_id , 
        order_date , 
        total_amount , 
        status 
FROM {{ source('raw_data' , 'orders')}}

{%if var('is_test_run' , default=true) %}

limit 20

{% endif %}
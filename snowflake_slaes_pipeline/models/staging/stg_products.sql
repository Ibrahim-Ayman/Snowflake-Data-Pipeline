SELECT  ID AS product_id ,
        name AS product_name ,
        category ,
        {{ safe_integer_cast('price') }} as price 
FROM {{ source('raw_data' , 'products')}}


{% if var('is_test_run' , default=true) %}

limit 20

{% endif %}

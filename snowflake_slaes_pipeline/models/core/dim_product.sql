SELECT  product_id , 
        product_name , 
        category as product_category , 
        price as product_price 
FROM {{ ref('stg_products')}}
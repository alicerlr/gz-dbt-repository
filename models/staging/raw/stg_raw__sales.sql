with 

source as (

    select * from {{ source('raw', 'sales') }}

),

renamed as (

    select
        date_date,
        orders_id,
        pdt_id AS products_id,
        revenue,
       CAST(quantity AS FLOAT64) as quantity

    from source

)

select * from renamed

SELECT 
    products_id, 
    date_date,
    orders_id,
    revenue,
    quantity,
    purchase_price,
    ROUND(s.quantity * CAST(p.purchase_price AS FLOAT64), 2) AS purchase_cost,
    s.revenue - ROUND(s.quantity * purchase_price, 2) AS margin,
    {{margin_percent('revenue', 'quantity * purchase_price')}} as margin_percent
FROM {{ref("stg_raw__sales")}} s
LEFT JOIN {{ref("stg_raw__product")}} p
        USING (products_id)

with

source as (
    select * from {{ source('stripe', 'payment') }}
),

renamed as (
    id as payment_id,
    orderid as order_id,
    paymentmethod as payment_method,
    status as payment_status,
    -- amount is stored in cents, convert it to dollars
    amount,
    created,
    _batched_at

    from source
)

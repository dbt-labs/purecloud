
with schedules as (

    select * from {{ ref('purecloud_user_schedule') }}

),

shifts as (

    select * from {{ ref('purecloud_user_schedule_shifts') }}

),


shift_activities as (

    select * from {{ ref('purecloud_user_schedule_shifts_activities') }}

),

users as (

    select * from {{ ref('purecloud_users_xf') }}

),

activity_codes as (

    select * from {{ ref('purecloud_activity_code') }}

),

renamed as (

    select
        schedules.id,
        schedules.start_date as date_day,
        schedules.user_id,

        shift_activities.batched_at,
        shift_activities.received_at,
        shift_activities.description,
        shift_activities.is_dst_fallback,
        shift_activities.shift_start,
        shift_activities.length_in_minutes as shift_length_in_minutes,

        activity_codes.category as activity_code_category,
        activity_codes.name as activity_code_name,

        activity_codes.activity_code_id,
        users.management_unit_id


    from schedules
    join shifts using (id)
    join shift_activities using (id)
    join users on users.user_id = schedules.user_id
    join activity_codes on users.management_unit_id = activity_codes.management_unit_id and shift_activities.activity_code_id = activity_codes.activity_code_id

)

select *,
    dateadd('minute', shift_length_in_minutes, shift_start::timestamp) as shift_end

from renamed


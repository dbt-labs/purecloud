
with renamed as (

    select
        to_char(_sdc_batched_at, 'YYYY-MM-DD HH24:MM:SS') as batched_at,
        to_char(_sdc_received_at, 'YYYY-MM-DD HH24:MM:SS') as received_at,
        _sdc_level_0_id as shift_index,
        _sdc_level_1_id as shift_activity_index,
        _sdc_source_key_start_date as start_date,
        _sdc_source_key_user_id as user_id,

        activity_code_id,
        counts_as_paid_time,
        description,
        is_dst_fallback,
        length_in_minutes::int,
        start_date::timestamp as shift_start

    from {{ var('user_schedule_shifts_activities_table') }}

)

select
    {{ dbt_utils.surrogate_key('start_date', 'user_id') }} as id,
    *

from renamed

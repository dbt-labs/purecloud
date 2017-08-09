
with renamed as (

    select
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
    md5(start_date || user_id) as id,
    *

from renamed


with renamed as (

    select
        _sdc_level_0_id as shift_index,
        _sdc_source_key_start_date as start_date,
        _sdc_source_key_user_id as user_id,

        length_in_minutes,
        start_date::timestamp as shift_start

    from {{ var('user_schedule_shifts_table') }}
)


select
    {{ dbt_utils.surrogate_key('start_date', 'user_id') }} as id,
    *

from renamed

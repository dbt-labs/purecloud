
select

    {{ dbt_utils.surrogate_key('start_date', 'user_id') }} as id,
    start_date::timestamp,
    user_id

from {{ var('user_schedule_table') }}

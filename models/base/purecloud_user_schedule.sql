
select
    md5(start_date || user_id) as id,
    start_date,
    user_id

from {{ var('user_schedule_table') }}

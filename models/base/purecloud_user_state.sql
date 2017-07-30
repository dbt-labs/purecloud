
select
    id as user_state_id,
    user_id,
    start_time,
    end_time,
    state,
    state_id,
    type

from {{ var('user_state_table') }}

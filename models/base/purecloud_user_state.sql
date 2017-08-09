
select
    id as user_state_id,
    user_id,
    start_time::timestamp,
    end_time::timestamp,
    state,
    state_id as presence_state_id,
    type

from {{ var('user_state_table') }}

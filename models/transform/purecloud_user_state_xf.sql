
with user_states as (

    select * from {{ ref('purecloud_user_state') }}

),

presence_states as (

    select * from {{ ref('purecloud_presence_state') }}

)

select
    user_state_id as id,
    user_id,

    start_time,
    coalesce(end_time, start_time::date + interval '1 day' - interval '1 second') as end_time,

    state,
    type,
    system_presence,
    label,
    lower(coalesce(label, state)) as state_xf

from user_states
left outer join presence_states using (presence_state_id)

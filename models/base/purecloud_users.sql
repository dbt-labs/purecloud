
select
    id as user_id,
    name,
    email,
    username,
    department,
    manager__id,
    state,
    title,
    version,
    chat__jabber_id as jabber_id

from {{ var('users_table') }}

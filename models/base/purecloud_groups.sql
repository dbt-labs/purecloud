
select
    id as group_id,
    name,
    member_count,
    description,
    rules_visible,
    self_uri,
    state,
    type,
    version,
    visibility,
    to_timestamp(date_modified, 'YYYY-MM-DD?HH24:MI:SS') as date_modified

from {{ var('groups_table') }}


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
    date_modified

from {{ var('groups_table') }}

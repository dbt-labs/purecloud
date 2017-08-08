
select
    id as queue_membership_id,
    queue_id,
    user_id,
    member_by,
    name,
    joined,
    ring_number

from {{ var('queue_membership_table') }}

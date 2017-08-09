
select
    conversation_id,
    conversation_start::timestamp,
    conversation_end::timestamp

from {{ var('conversation_table') }}

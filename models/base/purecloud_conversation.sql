
select
    conversation_id,
    conversation_end,
    conversation_start

from {{ var('conversation_table') }}

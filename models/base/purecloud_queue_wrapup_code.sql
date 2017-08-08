
select
    id as wrapup_code_id,
    queue_id,
    name

from {{ var('queue_wrapup_code_table') }}


select
    wrapup_code_id as id,
    queue_id,
    name

from {{ var('queue_wrapup_code_table') }}

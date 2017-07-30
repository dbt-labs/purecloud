
select
    id as activity_code_id,
    category,
    counts_as_paid_time,
    counts_as_work_time,
    is_active,
    is_agent_time_off_selectable,
    is_default,
    management_unit_id,
    name

from {{ var('activity_code_table') }}

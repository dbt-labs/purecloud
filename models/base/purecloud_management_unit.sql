
select
    id as management_unit_id,
    name

from {{ var('management_unit_table') }}

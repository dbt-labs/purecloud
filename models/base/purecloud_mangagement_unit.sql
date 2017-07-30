
select
    id as management_unit_id,
    name

from {{ var('mangagement_unit_table') }}

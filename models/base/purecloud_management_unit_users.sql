
select
    management_unit_id,
    user_id

from {{ var('management_unit_users_table') }}

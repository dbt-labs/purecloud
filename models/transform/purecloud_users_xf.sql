
with users as (

    select * from {{ ref('purecloud_users') }}

),

user_locations as (

    select *,
        row_number() over (partition by user_id order by location_index) as _dedupe
    from {{ ref('purecloud_users_locations') }}

),

management_unit_users as (

    select *,
        row_number() over (partition by user_id order by management_unit_id) as _dedupe

    from {{ ref('purecloud_management_unit_users') }}

),



-- in practice, there is only one location for a user
-- do this to dedupe in case that changes over time, or across orgs
user_primary_location as (

    select
        user_id,
        location_id

    from user_locations
    where _dedupe = 1

),

-- same as above for mgmt units
user_primary_management_unit as (

    select
        user_id,
        management_unit_id

    from management_unit_users
    where _dedupe = 1

)

select *
from users
join user_primary_location using (user_id)
join user_primary_management_unit using (user_id)

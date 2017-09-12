
with users as (

    select * from {{ ref('purecloud_users') }}

),

locations as (

    select * from {{ ref('purecloud_location') }}

),

management_units as (

    select * from {{ ref('purecloud_management_unit') }}

),

user_locations as (

    select *,
        row_number() over (partition by user_id order by location_index) as _dedupe
    from {{ ref('purecloud_users_locations') }}
    left join locations using (location_id)

),

management_unit_users as (

    select *,
        row_number() over (partition by user_id order by management_unit_id) as _dedupe

    from {{ ref('purecloud_management_unit_users') }}
    left join management_units using(management_unit_id)

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

select users.*,
    locations.name as location_name,
    locations.location_id,

    management_units.name as management_unit_name,
    management_units.management_unit_id

from users
left join user_primary_location using (user_id)
left join user_primary_management_unit using (user_id)
left join locations using (location_id)
left join management_units using (management_unit_id)

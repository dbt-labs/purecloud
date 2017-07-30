
select
    id as location_id,
    name,
    address__city,
    address__country,
    address__country_name,
    address__state,
    address__street1,
    address__zipcode,
    address_verified,
    emergency_number__e164,
    emergency_number__number,
    emergency_number__type,
    state,
    version

from {{ var('location_table') }}

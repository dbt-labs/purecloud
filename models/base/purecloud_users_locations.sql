
select
    _sdc_source_key_id as user_id,
    _sdc_level_0_id as location_index,
    location_definition__id as location_id,
    coordinates__x,
    coordinates__y,
    floorplan_id,
    notes

from {{ var('users_locations_table') }}


select
    id as presence_state_id,
    system_presence,

    language_labels__en_us as label,
    language_labels__fr,
    language_labels__nl,
    language_labels__en,

    deactivated,
    created_date::timestamp,
    modified_date::timestamp

from {{ var('presence_status_table') }}

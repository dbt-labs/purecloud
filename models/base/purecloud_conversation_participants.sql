
select
    _sdc_source_key_conversation_id as conversation_id,
    _sdc_level_0_id as participant_index,

    user_id,
    external_contact_id,
    participant_id,
    participant_name,
    purpose

from {{ var('conversation_participants_table') }}

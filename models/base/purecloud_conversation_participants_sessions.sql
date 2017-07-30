
select
    _sdc_source_key_conversation_id as conversation_id,
    _sdc_level_0_id as participant_index,
    _sdc_level_1_id as session_index,

    edge_id,
    room_id,
    media_type,
    session_id,
    script_id,

    ani,
    callback_user_name,
    direction,
    dnis,
    monitored_participant_id,
    skip_enabled,
    timeout_seconds,
    callback_scheduled_time,
    outbound_contact_list_id,
    outbound_contact_id,
    outbound_campaign_id

from {{ var('conversation_participants_sessions_table') }}


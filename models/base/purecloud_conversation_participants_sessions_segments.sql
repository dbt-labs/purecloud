
select
    _sdc_source_key_conversation_id as conversation_id,
    _sdc_level_0_id as participant_index,
    _sdc_level_1_id as session_index,
    _sdc_level_2_id as segment_index,

    source_conversation_id,
    destination_conversation_id,
    group_id,
    queue_id,

    segment_start,
    segment_end,
    segment_type,

    conference,
    disconnect_type,
    error_code,
    wrap_up_code,
    wrap_up_note

from {{ var('conversation_participants_sessions_segments_table') }}


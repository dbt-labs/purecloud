
select
    id as queue_id,
    name,
    member_count,
    acw_settings__timeout_ms,
    acw_settings__wrapup_prompt,
    calling_party_number,

    media_settings__call__alerting_timeout_seconds,
    media_settings__call__service_level__duration_ms,
    media_settings__call__service_level__percentage,
    media_settings__callback__alerting_timeout_seconds,
    media_settings__callback__service_level__duration_ms,
    media_settings__callback__service_level__percentage,
    media_settings__chat__alerting_timeout_seconds,
    media_settings__chat__service_level__duration_ms,
    media_settings__chat__service_level__percentage,
    media_settings__email__alerting_timeout_seconds,
    media_settings__email__service_level__duration_ms,
    media_settings__email__service_level__percentage,
    media_settings__socialexpression__alerting_timeout_seconds,
    media_settings__socialexpression__service_level__duration_ms,
    media_settings__socialexpression__service_level__percentage,

    date_created,
    created_by,

    date_modified,
    modified_by,

    skill_evaluation_method

from {{ var('queue_table') }}

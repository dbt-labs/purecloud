
with data as (
	select
		purecloud_conversations_xf.conversation_id,
		purecloud_conversations_xf.conversation_start,
		purecloud_conversations_xf.conversation_end,
		purecloud_conversations_xf.media_type,
		purecloud_conversations_xf.purpose,
		purecloud_conversations_xf.direction,
		segment_type,
		purecloud_users.name as user_name,
		
		
		datediff('second', segment_start, segment_end) as segment_time
	
	from dbt_dbanin.purecloud_conversations_xf
	join dbt_dbanin.purecloud_users using (user_id)
	left outer join dbt_dbanin.purecloud_users_locations using (user_id)
	left outer join dbt_dbanin.purecloud_location using (location_id)
	
	
	where conversation_start::date = '2017-07-10'
		and user_id = '34ae6140-850c-4cb1-8cb5-baec6fcd0662'
),

pivoted as (

	select
		conversation_id,
		conversation_start,
		conversation_end,
		media_type,
		purpose,
		direction,
		user_name,
		
		sum(case when segment_type = 'alert' then 1 else 0 end) as segment_alert_count,
		sum(case when segment_type = 'dialing' then 1 else 0 end) as segment_dialing_count,
		sum(case when segment_type = 'hold' then 1 else 0 end) as segment_hold_count,
		sum(case when segment_type = 'interact' then 1 else 0 end) as segment_interact_count,
		sum(case when segment_type = 'wrapup' then 1 else 0 end) as segment_wrapup_count,
		
		sum(case when segment_type = 'alert' then segment_time else 0 end) as segment_alert_time,
		sum(case when segment_type = 'dialing' then segment_time else 0 end) as segment_dialing_time,
		sum(case when segment_type = 'hold' then segment_time else 0 end) as segment_hold_time,
		sum(case when segment_type = 'interact' then segment_time else 0 end) as segment_interact_time,
		sum(case when segment_type = 'wrapup' then segment_time else 0 end) as segment_wrapup_time,

		sum(segment_time) as segment_total_time
	from data
	
	group by 1,2,3,4,5,6,7
	
)


-- 11,716

select
	conversation_start::date,
	user_name,
	media_type,
	purpose,
	
	sum(case when media_type = 'chat' then 1 else 0 end) as chats,
	sum(case when media_type = 'voice' then 1 else 0 end) as calls,

	sum(segment_interact_count) as interactions,
	sum(segment_interact_time) as total_interaction_time,
	avg(segment_interact_time) as average_interaction_time,

	sum(segment_hold_count) as holds,
	sum(segment_hold_time) as total_hold_time,
	avg(segment_hold_time) as average_hold_time,
	
	sum(segment_wrapup_count) as wrapups,
	sum(segment_wrapup_time) as total_wrapup_time,
	avg(segment_wrapup_time) as average_wrapup_time

from pivoted
group by 1, 2, 3, 4

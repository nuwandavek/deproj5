select station_id, day_of_week_type, hour_type, average_extra_docks_needed as excess_docks from {{ ref('loss') }} as table1
order by excess_docks limit 10
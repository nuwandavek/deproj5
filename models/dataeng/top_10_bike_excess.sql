select station_id, day_of_week_type, hour_type, average_extra_bikes_needed as excess_bikes from {{ ref('loss') }} as table1
order by excess_bikes limit 10
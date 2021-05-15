select station_id, day_of_week_type, hour_type, average_extra_bikes_needed from {{ ref('loss') }} as table1
order by average_extra_bikes_needed desc limit 10
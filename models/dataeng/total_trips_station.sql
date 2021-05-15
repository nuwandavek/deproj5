select 
case when starts.station_id is null then ends.station_id else starts.station_id end as station_id, 
case when starts.year is null then ends.year else starts.year end as year, 
case when starts.month is null then ends.month else starts.month end as month, 
case when starts.day is null then ends.day else starts.day end as day, 
case when starts.hour is null then ends.hour else starts.hour end as hour, 
case when starts.hour_type is null then ends.hour_type else starts.hour_type end as hour_type, 
case when starts.day_of_week is null then ends.day_of_week else starts.day_of_week end as day_of_week, 
case when starts.day_of_week_type is null then ends.day_of_week_type else starts.day_of_week_type end as day_of_week_type,
case when starts.start_trips is null then 0 else starts.start_trips end as start_trips,
case when ends.end_trips is null then 0 else ends.end_trips end as end_trips,

from {{ ref('start_trips_station') }} as starts
full outer join  {{ ref('end_trips_station') }} as ends
on starts.station_id = ends.station_id
and starts.year = ends.year
and starts.month = ends.month
and starts.day = ends.day
and starts.hour = ends.hour
and starts.hour_type = ends.hour_type
and starts.day_of_week = ends.day_of_week
and starts.day_of_week_type = ends.day_of_week_type

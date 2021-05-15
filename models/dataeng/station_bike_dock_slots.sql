select station_id, day_of_week_type, hour_type, avg(bike_zero_diff_frac) as average_bike_zero, avg(dock_zero_diff_frac)  as average_dock_zero from
(select *,  case when day_of_week in (1,7) then "weekday" else "weekend" end as day_of_week_type,
case when hour in (0,1,2,3,4,5) then "night" when hour in (6,7,8,9,10,11) then "morning" when hour in (12,13,14,15,16,17) then "afternoon" else "evening" end as hour_type,
from {{ ref('station_bike_dock_availability') }}) as table1
group by station_id, day_of_week_type, hour_type

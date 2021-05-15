select station_id, year, month, day, hour, day_of_week, 
case when day_of_week in (1,7) then "weekday" else "weekend" end as day_of_week_type,
case when hour in (0,1,2,3,4,5) then "night" when hour in (6,7,8,9,10,11) then "morning" when hour in (12,13,14,15,16,17) then "afternoon" else "evening" end as hour_type,
count(trip_id) as start_trips from (
select
EXTRACT(YEAR FROM start_date AT TIME ZONE 'America/Los_Angeles') as year,
EXTRACT(MONTH FROM start_date AT TIME ZONE 'America/Los_Angeles') as month,
EXTRACT(DAY FROM start_date AT TIME ZONE 'America/Los_Angeles') as day,
EXTRACT(HOUR FROM start_date AT TIME ZONE 'America/Los_Angeles') as hour,
EXTRACT(DAYOFWEEK FROM start_date AT TIME ZONE 'America/Los_Angeles') as day_of_week,
start_station_id as station_id, trip_id
from `bigquery-public-data.san_francisco.bikeshare_trips`) as table1
group by station_id, year, month, day, hour, day_of_week
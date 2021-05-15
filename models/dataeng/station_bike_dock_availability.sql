select year, month, day, hour, day_of_week, station_id, 
case when bikes_available=0 then TIMESTAMP_DIFF(time2,time, SECOND)/3600 else 0 end as bike_zero_diff_frac,
case when docks_available=0 then TIMESTAMP_DIFF(time2,time, SECOND)/3600 else 0 end as dock_zero_diff_frac from
(select *, lag(time,1) over (partition by station_id, year,month,day,hour order by time) as time2 from
(
select
EXTRACT(YEAR FROM time AT TIME ZONE 'America/Los_Angeles') as year,
EXTRACT(MONTH FROM time AT TIME ZONE 'America/Los_Angeles') as month,
EXTRACT(DAY FROM time AT TIME ZONE 'America/Los_Angeles') as day,
EXTRACT(HOUR FROM time AT TIME ZONE 'America/Los_Angeles') as hour,
EXTRACT(DAYOFWEEK FROM time AT TIME ZONE 'America/Los_Angeles') as day_of_week,
station_id, bikes_available, docks_available, time
from `bigquery-public-data.san_francisco.bikeshare_status`
order by time) as table1 ) as table2
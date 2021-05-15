select station_id, day_of_week_type, hour_type, avg(consumption) as average_consumption_per_hr from
(select station_id, year, month, day, hour, day_of_week_type, hour_type, start_trips-end_trips as consumption from
{{ ref('total_trips_station') }}) as table1
group by station_id, day_of_week_type, hour_type
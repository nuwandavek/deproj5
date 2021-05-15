
select table1.station_id, table1.day_of_week_type, table1.hour_type, average_bike_zero * average_consumption_per_hr as average_extra_bikes_needed, 
average_dock_zero * average_consumption_per_hr * -1 as average_extra_docks_needed from
{{ ref('station_consumption_rate') }} as table1 inner join {{ ref('station_bike_dock_slots') }} as table2 
on table1.station_id = table2.station_id
and table1.day_of_week_type = table2.day_of_week_type
and table1.hour_type = table2.hour_type

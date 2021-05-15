{{ config(materialized="incremental")}}

select station_id, year,month,day,hour_type, start_trips+end_trips as trip_volume,
rank() over (partition by year, month, day, hour_type order by start_trips+end_trips desc) as rank from
{{ ref('total_trips_station') }}

{% if is_incremental() %}
where year >= (select max(year) from {{this}})
and month >= (select max(month) from {{this}})
and day > (select max(day) from {{this}})
{% endif %}

order by trip_volume desc
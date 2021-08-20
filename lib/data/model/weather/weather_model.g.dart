// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) {
  return WeatherModel(
    json['name'] as String,
    (json['weather'] as List<dynamic>)
        .map((e) => Weather.fromJson(e as Map<String, dynamic>))
        .toList(),
    Main.fromJson(json['main'] as Map<String, dynamic>),
    Wind.fromJson(json['wind'] as Map<String, dynamic>),
    Sys.fromJson(json['sys'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$WeatherModelToJson(WeatherModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'weather': instance.weather,
      'main': instance.main,
      'wind': instance.wind,
      'sys': instance.sys,
    };

Weather _$WeatherFromJson(Map<String, dynamic> json) {
  return Weather(
    json['main'] as String,
    json['description'] as String,
    json['icon'] as String,
  );
}

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };

Main _$MainFromJson(Map<String, dynamic> json) {
  return Main(
    (json['temp'] as num).toDouble(),
    (json['temp_min'] as num).toDouble(),
    (json['temp_max'] as num).toDouble(),
    (json['pressure'] as num).toDouble(),
    (json['humidity'] as num).toDouble(),
  );
}

Map<String, dynamic> _$MainToJson(Main instance) => <String, dynamic>{
      'temp': instance.temp,
      'temp_min': instance.temp_min,
      'temp_max': instance.temp_max,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
    };

Wind _$WindFromJson(Map<String, dynamic> json) {
  return Wind(
    (json['speed'] as num).toDouble(),
  );
}

Map<String, dynamic> _$WindToJson(Wind instance) => <String, dynamic>{
      'speed': instance.speed,
    };

Sys _$SysFromJson(Map<String, dynamic> json) {
  return Sys(
    json['country'] as String,
  );
}

Map<String, dynamic> _$SysToJson(Sys instance) => <String, dynamic>{
      'country': instance.country,
    };

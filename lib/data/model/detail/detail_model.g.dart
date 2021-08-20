// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailModel _$DetailModelFromJson(Map<String, dynamic> json) {
  return DetailModel(
    (json['consolidated_weather'] as List<dynamic>)
        .map((e) => ConsolidatedWeather.fromJson(e as Map<String, dynamic>))
        .toList(),
    Parent.fromJson(json['parent'] as Map<String, dynamic>),
    json['title'] as String,
  );
}

Map<String, dynamic> _$DetailModelToJson(DetailModel instance) =>
    <String, dynamic>{
      'consolidated_weather': instance.consolidated_weather,
      'parent': instance.parent,
      'title': instance.title,
    };

ConsolidatedWeather _$ConsolidatedWeatherFromJson(Map<String, dynamic> json) {
  return ConsolidatedWeather(
    json['weather_state_name'] as String,
    json['applicable_date'] as String,
    (json['min_temp'] as num).toDouble(),
    (json['max_temp'] as num).toDouble(),
    (json['the_temp'] as num).toDouble(),
    (json['wind_speed'] as num).toDouble(),
    (json['air_pressure'] as num).toDouble(),
    (json['humidity'] as num).toDouble(),
  );
}

Map<String, dynamic> _$ConsolidatedWeatherToJson(
        ConsolidatedWeather instance) =>
    <String, dynamic>{
      'weather_state_name': instance.weather_state_name,
      'applicable_date': instance.applicable_date,
      'min_temp': instance.min_temp,
      'max_temp': instance.max_temp,
      'the_temp': instance.the_temp,
      'wind_speed': instance.wind_speed,
      'air_pressure': instance.air_pressure,
      'humidity': instance.humidity,
    };

Parent _$ParentFromJson(Map<String, dynamic> json) {
  return Parent(
    json['title'] as String,
  );
}

Map<String, dynamic> _$ParentToJson(Parent instance) => <String, dynamic>{
      'title': instance.title,
    };

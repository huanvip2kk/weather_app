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
    airPressure: (json['air_pressure'] as num).toDouble(),
    applicableDate: json['applicable_date'] as String,
    maxTemp: (json['max_temp'] as num).toDouble(),
    minTemp: (json['min_temp'] as num).toDouble(),
    theTemp: (json['the_temp'] as num).toDouble(),
    weatherStateName: json['weather_state_name'] as String,
    windSpeed: (json['wind_speed'] as num).toDouble(),
    humidity: (json['humidity'] as num).toDouble(),
  );
}

Map<String, dynamic> _$ConsolidatedWeatherToJson(
        ConsolidatedWeather instance) =>
    <String, dynamic>{
      'weather_state_name': instance.weatherStateName,
      'applicable_date': instance.applicableDate,
      'min_temp': instance.minTemp,
      'max_temp': instance.maxTemp,
      'the_temp': instance.theTemp,
      'wind_speed': instance.windSpeed,
      'air_pressure': instance.airPressure,
      'humidity': instance.humidity,
    };

Parent _$ParentFromJson(Map<String, dynamic> json) {
  return Parent(
    title: json['title'] as String,
  );
}

Map<String, dynamic> _$ParentToJson(Parent instance) => <String, dynamic>{
      'title': instance.title,
    };

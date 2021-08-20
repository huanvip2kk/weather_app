import 'package:json_annotation/json_annotation.dart';

part 'detail_model.g.dart';

enum WeatherCondition {
  snow,
  sleet,
  hail,
  thunderstorm,
  heavyRain,
  lightRain,
  showers,
  heavyCloud,
  lightCloud,
  clear,
  unknown
}

@JsonSerializable()
class DetailModel {
  // ignore: non_constant_identifier_names
  final List<ConsolidatedWeather> consolidated_weather;
  final Parent parent;
  final String title;

  factory DetailModel.fromJson(Map<String, dynamic> json) =>
      _$DetailModelFromJson(json);

  DetailModel(
    this.consolidated_weather,
    this.parent,
    this.title,
      //this.condition,
  );

  Map<String, dynamic> toJson() => _$DetailModelToJson(this);

  // static WeatherCondition _mapStringToWeatherCondition(String input) {
  //   WeatherCondition state;
  //   switch (input) {
  //     case 'sn':
  //       state = WeatherCondition.snow;
  //       break;
  //     case 'sl':
  //       state = WeatherCondition.sleet;
  //       break;
  //     case 'h':
  //       state = WeatherCondition.hail;
  //       break;
  //     case 't':
  //       state = WeatherCondition.thunderstorm;
  //       break;
  //     case 'hr':
  //       state = WeatherCondition.heavyRain;
  //       break;
  //     case 'lr':
  //       state = WeatherCondition.lightRain;
  //       break;
  //     case 's':
  //       state = WeatherCondition.showers;
  //       break;
  //     case 'hc':
  //       state = WeatherCondition.heavyCloud;
  //       break;
  //     case 'lc':
  //       state = WeatherCondition.lightCloud;
  //       break;
  //     case 'c':
  //       state = WeatherCondition.clear;
  //       break;
  //     default:
  //       state = WeatherCondition.unknown;
  //   }
  //   return state;
  // }

}

@JsonSerializable()
class ConsolidatedWeather {
  // ignore: non_constant_identifier_names
  final String weather_state_name;
  // ignore: non_constant_identifier_names
  final String applicable_date;
  // ignore: non_constant_identifier_names
  final double min_temp;
  // ignore: non_constant_identifier_names
  final double max_temp;
  // ignore: non_constant_identifier_names
  final double the_temp;
  // ignore: non_constant_identifier_names
  final double wind_speed;
  // ignore: non_constant_identifier_names
  final double air_pressure;
  final double humidity;

  ConsolidatedWeather(
      this.weather_state_name,
      this.applicable_date,
      this.min_temp,
      this.max_temp,
      this.the_temp,
      this.wind_speed,
      this.air_pressure,
      this.humidity);

  factory ConsolidatedWeather.fromJson(Map<String, dynamic> json) =>
      _$ConsolidatedWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$ConsolidatedWeatherToJson(this);
}

@JsonSerializable()
class Parent {
  final String title;

  Parent(this.title);

  factory Parent.fromJson(Map<String, dynamic> json) => _$ParentFromJson(json);

  Map<String, dynamic> toJson() => _$ParentToJson(this);
}

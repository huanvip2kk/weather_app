import 'package:json_annotation/json_annotation.dart';

part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel{

  final String name;
  final List<Weather> weather;
  final Main main;
  final Wind wind;
  final Sys sys;

  WeatherModel(this.name, this.weather, this.main, this.wind, this.sys);

  factory WeatherModel.fromJson(Map<String, dynamic> json) => _$WeatherModelFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);
}

@JsonSerializable()
class Weather{

  final String main;
  final String description;
  final String icon;

  Weather(this.main, this.description, this.icon);

  factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}

@JsonSerializable()
class Main {

  final double temp;
  // ignore: non_constant_identifier_names
  final double temp_min;
  // ignore: non_constant_identifier_names
  final double temp_max;
  final double pressure;
  final double humidity;

  Main(this.temp, this.temp_min, this.temp_max, this.pressure, this.humidity);

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);
  Map<String, dynamic> toJson() => _$MainToJson(this);
}

@JsonSerializable()
class Wind{

  final double speed;

  Wind(this.speed);

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);
  Map<String, dynamic> toJson() => _$WindToJson(this);
}

@JsonSerializable()
class Sys{
  final String country;

  Sys(this.country);

  factory Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);
  Map<String, dynamic> toJson() => _$SysToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'detail_model.g.dart';

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
  );

  Map<String, dynamic> toJson() => _$DetailModelToJson(this);
}

@JsonSerializable()
class ConsolidatedWeather {
  @JsonKey(name: 'weather_state_name')
  final String weatherStateName;

  @JsonKey(name: 'applicable_date')
  final String applicableDate;

  @JsonKey(name: 'min_temp')
  final double minTemp;

  @JsonKey(name: 'max_temp')
  final double maxTemp;

  @JsonKey(name: 'the_temp')
  final double theTemp;

  @JsonKey(name: 'wind_speed')
  final double windSpeed;

  @JsonKey(name: 'air_pressure')
  final double airPressure;

  final double humidity;

  ConsolidatedWeather({
    required this.airPressure,
    required this.applicableDate,
    required this.maxTemp,
    required this.minTemp,
    required this.theTemp,
    required this.weatherStateName,
    required this.windSpeed,
    required this.humidity,
  });

  factory ConsolidatedWeather.fromJson(Map<String, dynamic> json) =>
      _$ConsolidatedWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$ConsolidatedWeatherToJson(this);
}

@JsonSerializable()
class Parent {
  final String title;

  Parent({required this.title});

  factory Parent.fromJson(Map<String, dynamic> json) => _$ParentFromJson(json);

  Map<String, dynamic> toJson() => _$ParentToJson(this);
}

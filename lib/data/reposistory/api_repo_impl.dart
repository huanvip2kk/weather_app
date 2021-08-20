import '../api/get_detail_api/get_detail_api.dart';
import '../api/get_location_api/get_location_api.dart';
import '../api/get_weather_api/get_weather_api.dart';
import '../model/detail/detail_model.dart';
import '../model/location/location_model.dart';
import '../model/weather/weather_model.dart';

class ApiRepoImpl {
  final GetWeatherApi? getWeatherApi;
  final GetLocationApi? getLocationApi;
  final GetDetailApi? getDetailApi;

  ApiRepoImpl({
    this.getWeatherApi,
    this.getLocationApi,
    this.getDetailApi,
  });

  Future<WeatherModel> getWeather(
      {required double lat,
      required double lon,
      required String key,
      required String lang,
      required String units}) async {
    final weatherResponse = await getWeatherApi!.getWeather(
      lat,
      lon,
      key,
      lang,
      units,
    );
    return weatherResponse;
  }

  Future<List<LocationModel>> getLocation({
    required String location,
  }) async {
    final locationResponse = await getLocationApi!.getLocation(
      location,
    );
    return locationResponse;
  }

  Future<DetailModel> getDetail({
    required String woeid,
  }) async {
    final detailResponse = await getDetailApi!.getDetail(
      woeid,
    );
    return detailResponse;
  }
}

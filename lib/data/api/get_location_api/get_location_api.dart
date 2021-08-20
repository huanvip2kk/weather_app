import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../../model/location/location_model.dart';

part 'get_location_api.g.dart';

@RestApi(
  baseUrl: 'https://www.metaweather.com/api/',
)
abstract class GetLocationApi {
  factory GetLocationApi(Dio dio) = _GetLocationApi;

  @GET('location/search/?query={location}')
  Future<List<LocationModel>> getLocation(
      @Path('location') String location,
      );

}

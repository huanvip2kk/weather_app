import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../../model/detail/detail_model.dart';

part 'get_detail_api.g.dart';

@RestApi(
  baseUrl: 'https://www.metaweather.com/api',
)
abstract class GetDetailApi {
  factory GetDetailApi(Dio dio) = _GetDetailApi;

  @GET('/location/{woeid}/')
  Future<DetailModel> getDetail(
      @Path('woeid') String woeid,
      );

}

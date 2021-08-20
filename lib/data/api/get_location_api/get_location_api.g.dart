// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_location_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _GetLocationApi implements GetLocationApi {
  _GetLocationApi(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://www.metaweather.com/api/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<LocationModel>> getLocation(location) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<LocationModel>>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, 'location/search/?query=$location',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => LocationModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}

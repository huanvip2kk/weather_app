// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_detail_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _GetDetailApi implements GetDetailApi {
  _GetDetailApi(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://www.metaweather.com/api';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<DetailModel> getDetail(woeid) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<DetailModel>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/location/$woeid/',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = DetailModel.fromJson(_result.data!);
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

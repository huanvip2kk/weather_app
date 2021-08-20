
import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import '../../../data/model/weather/weather_model.dart';
import '../../../data/reposistory/api_repo_impl.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required this.apiRepoImpl}) : super(HomeInitState());

  ApiRepoImpl apiRepoImpl;
  final String _key = '4a80de72b34df28b6fa20967cf626513';

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is HomeLoadEvent) {
      try {
        yield HomeLoadingState();
        final position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );


        final response = await apiRepoImpl.getWeather(
          lat: position.latitude,
          lon: position.longitude,
          key: _key,
          lang: event.lang.toString(),
          units: event.units,
        );

        final WeatherModel weatherModel = response;

        // final String lat = position.latitude.toString();
        // final String lon = position.longitude.toString();
        //
        // final response = await Dio().get(
        //     'https://api.weatherbit.io/v2.0/current?lat=20.9&lon=105.34&key=1f0fcb26f2b043bb8d73b1e53b1bd8ad',
        // );
        //
        // print(response);
        // WeatherModel weatherModel = WeatherModel.fromJson(response.data);

        yield HomeLoadedState(
          weatherModel: weatherModel,
        );
      } catch (e) {
        yield HomeFailureState(message: e.toString());
      }
    }
  }
}

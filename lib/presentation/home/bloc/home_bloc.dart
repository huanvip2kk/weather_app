import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';

import '../../../data/model/weather/weather_model.dart';
import '../../../data/reposistory/api_repo_impl.dart';
import '../../../data/utils/shared_pref_manager.dart';
import '../../common/common_variable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required this.apiRepoImpl}) : super(HomeInitState());

  ApiRepoImpl apiRepoImpl;
  final String _key = '4a80de72b34df28b6fa20967cf626513';

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is HomeLoadEvent) {
      yield* _mapHomeLoadEventToState(
        homeLoadEvent: event,
      );
    } else if (event is HomeChangeEvent) {
      yield* _mapHomeChangeEventToState(
        homeChangeEvent: event,
      );
    }
  }

  Stream<HomeState> _mapHomeLoadEventToState(
      {required HomeLoadEvent homeLoadEvent}) async* {
    try {
      yield HomeLoadingState();
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      if (sharedPrefs.lang == vi) {
        final response = await apiRepoImpl.getWeather(
          lat: position.latitude,
          lon: position.longitude,
          key: _key,
          lang: 'vi',
        );

        yield HomeLoadedState(
          weatherModel: response,
        );
      } else if (sharedPrefs.lang == en) {
        final response = await apiRepoImpl.getWeather(
          lat: position.latitude,
          lon: position.longitude,
          key: _key,
          lang: 'en',
        );

        yield HomeLoadedState(
          weatherModel: response,
        );
      }
    } catch (e) {
      yield HomeFailureState(
        message: e.toString(),
      );
    }
  }

  Stream<HomeState> _mapHomeChangeEventToState(
      {required HomeChangeEvent homeChangeEvent}) async* {
    try {
      yield HomeLoadingState();
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      final response = await apiRepoImpl.getWeather(
        lat: position.latitude,
        lon: position.longitude,
        key: _key,
        lang: homeChangeEvent.lang.toString(),
      );

      yield HomeLoadedState(
        weatherModel: response,
      );
    } catch (e) {
      yield HomeFailureState(
        message: e.toString(),
      );
    }
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/model/location/location_model.dart';
import '../../../data/reposistory/api_repo_impl.dart';

part 'search_event.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc({required this.apiRepoImpl}) : super(SearchInitState(),);

  ApiRepoImpl apiRepoImpl;

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is SearchPressedEvent) {
      try {
        final response = await apiRepoImpl.getLocation(
          location: event.cityName,
        );
        final List<LocationModel> locationModel = response;
        print(response);

        // final response = await Dio().get(
        //     'https://www.metaweather.com/api/location/search/?query='+event.cityName,
        // );
        //
        // print(response);
        // final LocationModel locationModel = LocationModel.fromJson(response.data);

        yield SearchLoadedState();
        yield SearchResultState(
          locationModel: locationModel,
        );
      } catch (e) {
        yield SearchFailureState(message: e.toString(),);
      }
    } else if (event is SearchLoadEvent) {
      yield SearchLoadedState();
    }
  }
}

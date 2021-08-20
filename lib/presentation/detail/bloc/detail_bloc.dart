import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/model/detail/detail_model.dart';
import '../../../data/reposistory/api_repo_impl.dart';

part 'detail_event.dart';

part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc({required this.apiRepoImpl}) : super(DetailInitState());

  ApiRepoImpl apiRepoImpl;

  @override
  Stream<DetailState> mapEventToState(DetailEvent event) async* {
    if (event is DetailLoadEvent) {
      try {
        print(event.woeid);
        final response = await apiRepoImpl.getDetail(
            woeid: event.woeid,
        );

        final DetailModel detailModel = response;

        // final response = await Dio().get(
        //     'https://www.metaweather.com/api/location/search/?query='+event.cityName,
        // );
        //
        // print(response);
        // final DetailModel locationModel = DetailModel.fromJson(response.data);

        yield DetailLoadedState(detailModel: detailModel,);
      } catch (e) {
        yield DetailFailureState(message: e.toString());
      }
    }
  }
}
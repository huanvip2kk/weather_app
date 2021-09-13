import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/news/news_model.dart';
import '../../../data/utils/cloud_firestore_services/news_database_service.dart';

part 'news_list_event.dart';
part 'news_list_state.dart';

class NewsListBloc extends Bloc<NewsListEvent, NewsListState> {
  NewsListBloc() : super(NewsListInitState());


  @override
  Stream<NewsListState> mapEventToState(NewsListEvent event) async* {

    if (event is NewsListLoadEvent) {
      yield* _mapNewsListLoadEventToState();
    } else if (event is NewsListLoadedEvent) {
      yield* _mapNewsListLoadedEventToState(newsLoadedEvent: event);
    }
  }

  Stream<NewsListState> _mapNewsListLoadEventToState() async* {
    try {
      yield NewsListLoadingState();
      news.getListNews().listen(
            (news) => add(
              NewsListLoadedEvent(listNews: news),
            ),
          );
    } catch (e) {
      yield NewsListFailureState(
        message: e.toString(),
      );
    }
  }

  Stream<NewsListState> _mapNewsListLoadedEventToState(
      {required NewsListLoadedEvent newsLoadedEvent}) async* {
    try {
      yield NewsListLoadingState();

      yield NewsListLoadedState(
        listNews: newsLoadedEvent.listNews,
      );

    } catch (e) {
      yield NewsListFailureState(
        message: e.toString(),
      );
    }
  }
}

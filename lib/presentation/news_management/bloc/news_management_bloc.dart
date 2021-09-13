import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/news/news_model.dart';
import '../../../data/utils/cloud_firestore_services/news_database_service.dart';

part 'news_management_event.dart';
part 'news_management_state.dart';

class NewsManagementBloc
    extends Bloc<NewsManagementEvent, NewsManagementState> {
  NewsManagementBloc() : super(NewsManagementInitState());

  @override
  Stream<NewsManagementState> mapEventToState(
      NewsManagementEvent event) async* {
    if (event is NewsManagementLoadEvent) {
      yield* _mapNewsManagementLoadEventToState();
    } else if (event is NewsManagementLoadedEvent) {
      yield* _mapNewsManagementLoadedEventToState(
        newsManagementLoadedEvent: event,
      );
    } else if (event is NewsManagementDeletePressedEvent) {
      yield* _mapNewsManagementDeletePressedEventToState(
        newsManagementDeletePressedEvent: event,
      );
    }
  }

  Stream<NewsManagementState> _mapNewsManagementLoadEventToState() async* {
    try {
      yield NewsManagementLoadingState();
      news.getListNews().listen(
            (news) => add(
              NewsManagementLoadedEvent(
                listNews: news,
              ),
            ),
          );
    } catch (e) {
      yield NewsManagementFailureState(
        message: e.toString(),
      );
    }
  }

  Stream<NewsManagementState> _mapNewsManagementLoadedEventToState(
      {required NewsManagementLoadedEvent newsManagementLoadedEvent}) async* {
    try {
      yield NewsManagementLoadingState();
      yield NewsManagementLoadedState(
        listNews: newsManagementLoadedEvent.listNews,
      );
    } catch (e) {
      yield NewsManagementFailureState(
        message: e.toString(),
      );
    }
  }

  Stream<NewsManagementState> _mapNewsManagementDeletePressedEventToState(
      {required NewsManagementDeletePressedEvent
          newsManagementDeletePressedEvent}) async* {
    try {
      yield NewsManagementLoadingState();
      await news.deleteNews(
        docID: newsManagementDeletePressedEvent.docID,
      );
    } catch (e) {
      yield NewsManagementFailureState(
        message: e.toString(),
      );
    }
  }
}

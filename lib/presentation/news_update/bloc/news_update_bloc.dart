import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/utils/cloud_firestore_services/news_database_service.dart';

part 'news_update_event.dart';

part 'news_update_state.dart';

class NewsUpdateBloc extends Bloc<NewsUpdateEvent, NewsUpdateState> {
  NewsUpdateBloc() : super(NewsUpdateInitState());

  @override
  Stream<NewsUpdateState> mapEventToState(NewsUpdateEvent event) async* {
    if (event is NewsUpdateLoadEvent) {
      yield* _mapNewsUpdateLoadEventToState();
    } else if (event is NewsUpdatePressedEvent) {
      yield* _mapNewsManagementUpdatePressedEventToState(
        newsManagementUpdatePressedEvent: event,
      );
    }
  }

  Stream<NewsUpdateState> _mapNewsUpdateLoadEventToState() async* {
    try {
      yield NewsUpdateLoadingState();
      yield NewsUpdateLoadedState();
    } catch (e) {
      yield NewsUpdateFailureState(
        message: e.toString(),
      );
    }
  }

  Stream<NewsUpdateState> _mapNewsManagementUpdatePressedEventToState(
      {required NewsUpdatePressedEvent
          newsManagementUpdatePressedEvent}) async* {
    try {
      yield NewsUpdateLoadingState();

      await news.newsUpdate(
        title: newsManagementUpdatePressedEvent.title,
        content: newsManagementUpdatePressedEvent.content,
        images: newsManagementUpdatePressedEvent.images,
        thumbnails: newsManagementUpdatePressedEvent.thumbnails,
        brief: newsManagementUpdatePressedEvent.brief,
        uploadTime: newsManagementUpdatePressedEvent.uploadTime,
        docID: newsManagementUpdatePressedEvent.docID,
        thumbnailsLink: newsManagementUpdatePressedEvent.thumbnailsLink,
      );
    } catch (e) {
      yield NewsUpdateFailureState(
        message: e.toString(),
      );
    }
  }
}

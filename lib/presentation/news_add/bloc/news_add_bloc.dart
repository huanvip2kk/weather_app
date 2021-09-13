import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/users/users_model.dart';
import '../../../data/utils/cloud_firestore_services/news_database_service.dart';
import '../../../data/utils/cloud_firestore_services/users_database_services.dart';

part 'news_add_event.dart';

part 'news_add_state.dart';

class NewsAddBloc extends Bloc<NewsAddEvent, NewsAddState> {
  NewsAddBloc() : super(NewsAddInitState());

  UsersModel? _usersModel;

  @override
  Stream<NewsAddState> mapEventToState(NewsAddEvent event) async* {
    _usersModel =
        await users.getUser(email: FirebaseAuth.instance.currentUser!.email!);
    if (event is NewsAddLoadEvent) {
      yield* _mapNewsAddLoadEventToState();
    } else if (event is NewsAddPressedEvent) {
      yield* _mapNewsAddPressedEventToState(
        newsAddPressedEvent: event,
      );
    }
  }

  Stream<NewsAddState> _mapNewsAddLoadEventToState() async* {
    try {
      yield NewsAddLoadingState();
      yield NewsAddLoadedState();
    } catch (e) {
      yield NewsAddFailureState(
        message: e.toString(),
      );
    }
  }

  Stream<NewsAddState> _mapNewsAddPressedEventToState(
      {required NewsAddPressedEvent newsAddPressedEvent}) async* {
    yield NewsAddLoadingState();
    try {
      await news.newsAdd(
        images: newsAddPressedEvent.images,
        title: newsAddPressedEvent.title,
        content: newsAddPressedEvent.content,
        thumbnails: newsAddPressedEvent.thumbnails,
        author: _usersModel!.name,
        brief: newsAddPressedEvent.brief,
        docID: news.news.doc().id,
      );
      yield NewsAddLoadedState();
    } catch (error) {
      yield NewsAddFailureState(
        message: error.toString(),
      );
    }
  }
}

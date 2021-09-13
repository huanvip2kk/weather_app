import 'package:flutter/material.dart';
import '../../data/model/news/news_model.dart';

import 'ui/news_detail_screen.dart';

class NewsDetailScreenRoute {
  static Widget route({required NewsModel newsModel}) => NewsDetailScreen(
        newsModel: newsModel,
      );
}

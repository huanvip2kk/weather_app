import 'package:flutter/material.dart';

import '../../../data/model/news/news_model.dart';
import '../../common/widget/back_app_bar_icon_button.dart';
import 'widget/news_detail_widget.dart';

class NewsDetailScreen extends StatelessWidget {
  const NewsDetailScreen({
    Key? key,
    required this.newsModel,
  }) : super(key: key);
  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: const BackAppBarIconButton(),
      ),
      body: NewsDetailWidget(
        newsModel: newsModel,
      ),
    );
  }
}

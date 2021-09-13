import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/app_text_style.dart';
import '../../../../data/model/news/news_model.dart';

class NewsDetailWidget extends StatelessWidget {
  const NewsDetailWidget({
    Key? key,
    required this.newsModel,
  }) : super(key: key);
  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              newsModel.title,
              style: AppTextStyle.fontSize20.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Image.network(
              newsModel.thumbnails,
              height: 200.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            SizedBox(
              height: 16.h,
            ),
            Text(newsModel.content,style: AppTextStyle.fontSize20,),
          ],
        ),
      ),
    );
  }
}

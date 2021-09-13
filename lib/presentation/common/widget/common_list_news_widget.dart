import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/app_text_style.dart';

class CommonListNewsWidget extends StatelessWidget {
  const CommonListNewsWidget({
    Key? key,
    required this.brief,
    required this.onTap,
    required this.thumbnails,
    required this.title,
    required this.uploadTime,
  }) : super(key: key);

  final VoidCallback onTap;
  final String thumbnails;
  final String title;
  final String brief;
  final String uploadTime;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: onTap,
          child: Row(
            children: [
              Image.network(
                thumbnails,
                height: 120.h,
                width: 120.w,
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: 10.w,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyle.fontSize24.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        brief,
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ),
                    Text(uploadTime)
                  ],
                ),
              )
            ],
          ),
        ),
      );
}

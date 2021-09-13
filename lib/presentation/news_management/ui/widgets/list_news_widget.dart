import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../generated/l10n.dart';
import '../../../../utils/route/app_routing.dart';
import '../../../common/method/common_show_dialog.dart';
import '../../../common/widget/common_list_news_widget.dart';
import '../../bloc/news_management_bloc.dart';

class ListNewsWidget extends StatelessWidget {
  const ListNewsWidget({
    Key? key,
    required this.newsManagementLoadedState,
    required this.blocContext,
  }) : super(key: key);
  final NewsManagementLoadedState newsManagementLoadedState;
  final BuildContext blocContext;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemBuilder: (context, index) => CommonListNewsWidget(
          brief: newsManagementLoadedState.listNews.elementAt(index).brief,
          onTap: () => commonShowDialog(
            context: context,
            title1: S.current.edit,
            icon1: const Icon(
              Icons.edit,
            ),
            onTap1: () async {
              await Navigator.pushNamed(
                context,
                RouteDefine.newsUpdateScreen.name,
                arguments: newsManagementLoadedState.listNews.elementAt(index),
              );
              Navigator.pop(context);
            },
            title2: S.current.delete,
            icon2: const Icon(
              Icons.delete,
            ),
            onTap2: () {
              blocContext.read<NewsManagementBloc>().add(
                    NewsManagementDeletePressedEvent(
                      docID: newsManagementLoadedState.listNews
                          .elementAt(index)
                          .docID,
                    ),
                  );
              Navigator.pop(context);
            },
          ),
          thumbnails:
              newsManagementLoadedState.listNews.elementAt(index).thumbnails,
          title: newsManagementLoadedState.listNews.elementAt(index).title,
          uploadTime:
              newsManagementLoadedState.listNews.elementAt(index).uploadTime,
        ),
        itemCount: newsManagementLoadedState.listNews.length,
      ),
    );
  }
}

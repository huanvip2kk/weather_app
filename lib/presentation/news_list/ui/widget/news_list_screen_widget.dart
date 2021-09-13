import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../utils/route/app_routing.dart';
import '../../../common/widget/common_list_news_widget.dart';
import '../../bloc/news_list_bloc.dart';

class NewsListScreenWidget extends StatefulWidget {
  const NewsListScreenWidget({
    Key? key,
    required this.state,
  }) : super(key: key);

  final NewsListLoadedState state;

  @override
  _NewsListScreenWidgetState createState() => _NewsListScreenWidgetState();
}

class _NewsListScreenWidgetState extends State<NewsListScreenWidget> {
  onRefresh(userCred) {
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onRefresh(FirebaseAuth.instance.currentUser);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemBuilder: (context, index) => CommonListNewsWidget(
          brief: widget.state.listNews.elementAt(index).brief,
          onTap: () => Navigator.pushNamed(
            context,
            RouteDefine.newsDetailScreen.name,
            arguments: widget.state.listNews.elementAt(index),
          ),
          thumbnails: widget.state.listNews.elementAt(index).thumbnails,
          title: widget.state.listNews.elementAt(index).title,
          uploadTime: widget.state.listNews.elementAt(index).uploadTime,
        ),
        itemCount: widget.state.listNews.length,
      ),
    );
  }
}

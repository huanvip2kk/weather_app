import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../config/app_colors.dart';
import '../../../generated/l10n.dart';
import '../../account/accout_route.dart';
import '../../home/home_screen_route.dart';
import '../../news_list/news_list_route.dart';
import '../../search/search_route.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final tabs = [
    HomeScreenRoute.route,
    SearchScreenRoute.route,
    NewsListScreenRoute.route,
    AccountScreenRoute.route,
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: tabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: tabs.length,
        child: TabBarView(controller: _tabController, children: tabs),
      ),
      bottomNavigationBar: ConvexAppBar(
        height: 50.h,
        backgroundColor: AppColors.primaryColor,
        style: TabStyle.flip,
        items: [
          TabItem(
            icon: Icons.home,
            title: S.current.home,
          ),
          TabItem(
            icon: Icons.search,
            title: S.current.search,
          ),
          TabItem(
            icon: FontAwesomeIcons.newspaper,
            title: S.current.news,
          ),
          TabItem(
            icon: Icons.person,
            title: S.current.account,
          ),
        ],
        initialActiveIndex: 0,
        controller: _tabController,
      ),
    );
  }
}

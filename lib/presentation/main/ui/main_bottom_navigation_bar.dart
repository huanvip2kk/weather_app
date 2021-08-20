import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

import '../../../config/app_colors.dart';
import '../../../generated/l10n.dart';
import '../../account/ui/account_screen.dart';
import '../../home/ui/home_screen.dart';
import '../../search/ui/search_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final tabs = [
    const HomeScreen(),
    SearchScreen(),
    const AccountScreen(),
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
  Widget build(BuildContext context) => Scaffold(
        body: DefaultTabController(
          length: tabs.length,
          child: TabBarView(controller: _tabController, children: tabs),
        ),
        bottomNavigationBar: ConvexAppBar(
          backgroundColor: AppColors.kPrimaryColor,
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
              icon: Icons.person,
              title: S.current.account,
            ),
          ],
          initialActiveIndex: 0,
          controller: _tabController,
        ),
      );
}

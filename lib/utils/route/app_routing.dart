import 'package:flutter/material.dart';

import '../../data/model/news/news_model.dart';
import '../../data/model/users/users_model.dart';
import '../../presentation/account/accout_route.dart';
import '../../presentation/account_list/account_list_route.dart';
import '../../presentation/account_update/account_update_route.dart';
import '../../presentation/detail/detail_route.dart';
import '../../presentation/detail/ui/detail_screen.dart';
import '../../presentation/favorites_list/favorites_list_screen_route.dart';
import '../../presentation/forgot_password/forgot_password_route.dart';
import '../../presentation/home/home_screen_route.dart';
import '../../presentation/index/login_signup_index_route.dart';
import '../../presentation/login_with_email/login_route.dart';
import '../../presentation/main/main_route.dart';
import '../../presentation/news_add/news_add_route.dart';
import '../../presentation/news_detail/news_detail_route.dart';
import '../../presentation/news_list/news_list_route.dart';
import '../../presentation/news_management/news_management_route.dart';
import '../../presentation/news_update/news_update_route.dart';
import '../../presentation/search/search_route.dart';
import '../../presentation/settings/settings_route.dart';
import '../../presentation/signup_with_email/signup_route.dart';
import '../../presentation/splash/splash_screen_route.dart';

enum RouteDefine {
  homeScreen,
  loginScreen,
  signupScreen,
  splashScreen,
  loginSignupIndexScreen,
  forgotPasswordScreen,
  mainScreen,
  searchScreen,
  detailScreen,
  favoritesListScreen,
  settingsScreen,
  newsScreen,
  newsDetailScreen,
  accountManagementScreen,
  accountChangeScreen,
  accountScreen,
  newsUpdateScreen,
  accountListScreen,
  accountUpdateScreen,
  newsListScreen,
  newsAddScreen,
  newsManagementScreen,
}

class AppRouting {
  static MaterialPageRoute generateRoute(RouteSettings settings) {
    final routes = <String, WidgetBuilder>{
      RouteDefine.homeScreen.name: (_) => HomeScreenRoute.route,
      RouteDefine.accountUpdateScreen.name: (_) =>
          AccountUpdateScreenRoute.route(
            usersModel: settings.arguments as UsersModel,
          ),
      RouteDefine.accountListScreen.name: (_) => AccountListScreenRoute.route,
      RouteDefine.accountScreen.name: (_) => AccountScreenRoute.route,
      RouteDefine.loginScreen.name: (_) => LoginScreenRoute.route,
      RouteDefine.signupScreen.name: (_) => SignupScreenRoute.route,
      RouteDefine.splashScreen.name: (_) => SplashScreenRoute.route,
      RouteDefine.mainScreen.name: (_) => MainScreenRoute.route,
      RouteDefine.favoritesListScreen.name: (_) =>
          FavoritesListScreenRoute.route,
      RouteDefine.searchScreen.name: (_) => SearchScreenRoute.route,
      RouteDefine.detailScreen.name: (_) =>
          DetailScreenRoute.route(settings.arguments as DetailArguments),
      RouteDefine.forgotPasswordScreen.name: (_) =>
          ForgotPasswordScreenRoute.route,
      RouteDefine.loginSignupIndexScreen.name: (_) =>
          LoginSignupIndexScreenRoute.route,
      RouteDefine.settingsScreen.name: (_) => SettingsScreenRoute.route,
      RouteDefine.newsDetailScreen.name: (_) => NewsDetailScreenRoute.route(
            newsModel: settings.arguments as NewsModel,
          ),
      RouteDefine.newsUpdateScreen.name: (_) => NewsUpdateScreenRoute.route(
            newsModel: settings.arguments as NewsModel,
          ),
      RouteDefine.newsManagementScreen.name: (_) =>
          NewsManagementScreenRoute.route,
      RouteDefine.newsAddScreen.name: (_) => NewsAddScreenRoute.route,
      RouteDefine.newsListScreen.name: (_) => NewsListScreenRoute.route,
    };

    final routeBuilder = routes[settings.name];

    return MaterialPageRoute(
      builder: (context) => routeBuilder!(context),
      settings: RouteSettings(name: settings.name),
    );
  }
}

extension RouteExt on Object {
  String get name => toString().substring(toString().indexOf('.') + 1);
}

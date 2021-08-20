import 'package:flutter/material.dart';
import '../../data/model/location/location_model.dart';
import '../../presentation/detail/detail_route.dart';
import '../../presentation/home/home_screen_route.dart';
import '../../presentation/login_signup/login_signup_index_route.dart';
import '../../presentation/login_signup/login_with_email/login_route.dart';
import '../../presentation/login_signup/login_with_email/login_screen_nested/forgot_password/forgot_password_route.dart';
import '../../presentation/login_signup/signup_with_email/signup_route.dart';
import '../../presentation/main/main_route.dart';
import '../../presentation/search/search_route.dart';
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
}

class AppRouting {
  static MaterialPageRoute generateRoute(RouteSettings settings) {
    final routes = <String, WidgetBuilder>{
      RouteDefine.homeScreen.name: (_) => HomeScreenRoute.route,
      RouteDefine.loginScreen.name: (_) => LoginScreenRoute.route,
      RouteDefine.signupScreen.name: (_) => SignupScreenRoute.route,
      RouteDefine.splashScreen.name: (_) => SplashScreenRoute.route,
      RouteDefine.mainScreen.name: (_) => MainScreenRoute.route,
      RouteDefine.searchScreen.name: (_) => SearchScreenRoute.route,
      RouteDefine.detailScreen.name: (_) =>
          DetailScreenRoute.route(settings.arguments as LocationModel),
      RouteDefine.forgotPasswordScreen.name: (_) => ForgotPasswordRoute.route,
      RouteDefine.loginSignupIndexScreen.name: (_) =>
          LoginSignupIndexScreenRoute.route,
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

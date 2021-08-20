// import 'package:fluro/fluro.dart';
// import 'package:weather_app/data/model/location_model.dart';
// import 'package:weather_app/presentation/detail/detail_route.dart';
// import 'package:weather_app/presentation/search/search_route.dart';
//
// import '../../presentation/home/home_screen_route.dart';
// import '../../presentation/login_signup/login_signup_index_route.dart';
// import '../../presentation/login_signup/login_with_email/login_route.dart';
// import '../../presentation/login_signup/login_with_email/login_screen_nested/forgot_password/ui/forgor_password_screen.dart';
// import '../../presentation/login_signup/signup_with_email/signup_route.dart';
// import '../../presentation/main/main_route.dart';
// import '../../presentation/splash/splash_screen_route.dart';
//
// enum RouteDefine {
//   homeScreen,
//   loginScreen,
//   signUpScreen,
//   splashScreen,
//   loginSignupIndexScreen,
//   forgotPasswordScreen,
//   mainScreen,
//   searchScreen,
//   detailScreen,
// }
//
// class FluroRouting {
//   static final router = FluroRouter();
//
//   static final _loginScreen = Handler(
//     handlerFunc: (context, params) =>
//     LoginScreenRoute.route,
//   );
//
//   static final _signUpScreen = Handler(
//     handlerFunc: (context, params) =>
//     SignupScreenRoute.route,
//   );
//
//   static final _homeScreen = Handler(
//     handlerFunc: (context, params) => HomeScreenRoute.route,
//   );
//
//   static final _forgotPasswordScreen = Handler(
//     handlerFunc: (context, params) =>
//         ForgotPasswordScreen(),
//   );
//
//   static final _splashScreen = Handler(
//     handlerFunc: (context, params) =>
//     SplashScreenRoute.route,
//   );
//
//   static final _loginSignupIndexScreen = Handler(
//     handlerFunc: (context, params) =>
//     LoginSignupIndexScreenRoute.route,
//   );
//
//   static final _mainScreen = Handler(
//     handlerFunc: (context, params) =>
//     MainScreenRoute.route,
//   );
//
//   static final _searchScreen = Handler(
//     handlerFunc: (context, params) =>
//     SearchScreenRoute.route,
//   );
//
//   static final _detailScreen = Handler(
//     handlerFunc: (context, params) {
//       DetailScreenRoute.route;
//       params = LocationModel as Map<String, List<String>>;
//     },
//   );
//
//
//   static void setupRouter() {
//     router.define(
//       RouteDefine.loginScreen.name,
//       handler: _loginScreen,
//     );
//
//     router.define(
//       RouteDefine.splashScreen.name,
//       handler: _splashScreen,
//     );
//
//     router.define(
//       RouteDefine.loginSignupIndexScreen.name,
//       handler: _loginSignupIndexScreen,
//     );
//
//     router.define(
//       RouteDefine.signUpScreen.name,
//       handler: _signUpScreen,
//       transitionType: TransitionType.inFromLeft,
//     );
//
//     router.define(
//       RouteDefine.forgotPasswordScreen.name,
//       handler: _forgotPasswordScreen,
//       transitionType: TransitionType.inFromLeft,
//     );
//
//     router.define(
//       RouteDefine.homeScreen.name,
//       handler: _homeScreen,
//       transitionType: TransitionType.inFromTop,
//     );
//
//     router.define(
//       RouteDefine.mainScreen.name,
//       handler: _mainScreen,
//       transitionType: TransitionType.inFromTop,
//     );
//
//     router.define(
//       RouteDefine.searchScreen.name,
//       handler: _searchScreen,
//       transitionType: TransitionType.inFromTop,
//     );
//
//     router.define(
//       RouteDefine.detailScreen.name,
//       handler: _detailScreen,
//       transitionType: TransitionType.inFromTop,
//     );
//   }
// }
//
// extension RouteExt on Object {
//   String get name => toString().substring(toString().indexOf('.') + 1);
// }

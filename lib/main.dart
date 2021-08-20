// import 'package:device_preview/device_preview.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import 'utils/route/fluro_routing.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   FluroRouting.setupRouter();
//   runApp(
//     DevicePreview(
//       enabled: !kReleaseMode,
//       builder: (context) => EasyLocalization(
//           supportedLocales: [Locale('en', 'US'), Locale('vi', 'VN'),],
//           path: '/translations', // <-- change the path of the translation files
//           fallbackLocale: Locale('en', 'US'),
//           child: MyApp(),
//         saveLocale: true,
//         startLocale: Locale('en','US'),
//       ), // Wrap your app
//     ),
//   );
// }
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       designSize: const Size(375, 812),
//       builder: () => MaterialApp(
//         localizationsDelegates: context.localizationDelegates,
//         supportedLocales: context.supportedLocales,
//         locale: context.locale,
//         builder: DevicePreview.appBuilder,
//         title: 'Weather app',
//         debugShowCheckedModeBanner: false,
//         initialRoute: RouteDefine.loginSignupIndexScreen.name,
//         onGenerateRoute: FluroRouting.router.generator,
//       ),
//     );
//   }
// }

import 'package:bloc/bloc.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'config/app_colors.dart';
import 'generated/l10n.dart';
import 'simple_bloc_observer.dart';
import 'utils/route/app_routing.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: () => MaterialApp(
          color: AppColors.kPrimaryColor,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          title: 'Weather app',
          initialRoute: RouteDefine.splashScreen.name,
          onGenerateRoute: AppRouting.generateRoute,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
        ),
      );
}

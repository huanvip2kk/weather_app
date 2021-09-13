import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../data/utils/shared_pref_manager.dart';
import '../../../gen/assets.gen.dart';
import '../../../generated/l10n.dart';
import '../../../utils/route/app_routing.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> changeScreen() async {
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(
        context,
        RouteDefine.mainScreen.name,
      ),
    );
  }

  final String vi = 'Tiếng Việt';
  final String en = 'English';

  initLang() {
    if (sharedPrefs.lang == vi) {
      S.load(
        const Locale('vi', 'VN'),
      );
    } else if (sharedPrefs.lang == en) {
      S.load(
        const Locale('en', 'EN'),
      );
    } else if (sharedPrefs.lang == null) {
      S.load(
        const Locale('vi', 'VN'),
      );
      sharedPrefs.setStringToSF(lang: vi);
    }
  }

  initMetric() {
    if (sharedPrefs.metric == null) {
      sharedPrefs.setBoolToSF(metric: false);
    }
  }

  @override
  void initState() {
    super.initState();
    changeScreen();
    initLang();
    initMetric();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SvgPicture.asset(
            Assets.svgImages.weather4.path,
          ),
        ),
      ),
    );
  }
}

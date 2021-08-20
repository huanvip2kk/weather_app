import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../gen/assets.gen.dart';
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
          context, RouteDefine.mainScreen.name),
    );
  }

  @override
  void initState() {
    changeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    changeScreen();
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

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../shared/theme/constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void pageCondition() async {
    final prefs = await SharedPreferences.getInstance();
    bool isNotFirst = prefs.getBool('isNotFirst') ?? false;
    bool isLogin = prefs.getBool('isLogin') ?? false;
    if (isNotFirst && !isLogin) {
      Timer(const Duration(seconds: 2), () {
        Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
      });
    } else if (isNotFirst && isLogin) {
      Timer(const Duration(seconds: 2), () {
        Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
      });
    } else {
      Timer(const Duration(seconds: 2), () {
        Navigator.pushNamedAndRemoveUntil(
            context, '/onboarding', (route) => false);
      });
    }
  }

  @override
  void initState() {
    pageCondition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo_app.png',
                scale: 8,
              ),
              Text(
                appName,
                style: TextStyle(
                    fontFamily: GoogleFonts.cedarvilleCursive().fontFamily,
                    fontSize: 40,
                    color: primaryColor),
              )
            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tugas_akhir_app/ui/pages/authentication_page/login_page.dart';
import 'package:tugas_akhir_app/ui/pages/authentication_page/registration_page.dart';
import 'package:tugas_akhir_app/ui/pages/main_page/main_page.dart';
import 'package:tugas_akhir_app/ui/shared/theme/theme.dart';
import 'ui/pages/splash_screen/splash_screen.dart';
import 'ui/pages/onboarding_page/onboarding_page.dart';
import 'package:device_preview/device_preview.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const MyApp());
  // runApp(
  //   DevicePreview(builder: (context) => const MyApp())
  // );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      builder: (context, child) => ResponsiveWrapper.builder(
        child,
        maxWidth: 1200,
        minWidth: 380,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.resize(380, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(600, name: TABLET),
        ]
      ),
      theme: theme,
      // routes: {
      //   '/' :(context) => const SplashScreen(),
      //   '/onboarding' :(context) => const OnboardingPage(),
      //   '/login' :(context) => const LoginPage(),
      //   '/registration' :(context) => const RegistrationPage(),
      //   '/main' :(context) => const MainPage()
      // },
      home: const MainPage()
    );
  }
}
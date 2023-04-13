import 'package:flutter/material.dart';
import 'package:tugas_akhir_app/ui/pages/authentication_page/login_page.dart';
import 'package:tugas_akhir_app/ui/pages/authentication_page/registration_page.dart';
import 'package:tugas_akhir_app/ui/pages/main_page/home_page/fitur_page/create_information_page.dart';
import 'package:tugas_akhir_app/ui/pages/main_page/home_page/fitur_page/disability_page.dart';
import 'package:tugas_akhir_app/ui/pages/main_page/home_page/fitur_page/fitur_page.dart';
import 'package:tugas_akhir_app/ui/pages/main_page/main_page.dart';
import 'package:tugas_akhir_app/ui/pages/main_page/profile_page/profile_detail_page/about_page.dart';
import 'package:tugas_akhir_app/ui/pages/main_page/profile_page/profile_detail_page/faq_page.dart';
import 'package:tugas_akhir_app/ui/shared/theme/theme.dart';
import 'package:tugas_akhir_app/ui/pages/main_page/home_page/fitur_page/prosthetic_workshop_page.dart';
import 'ui/pages/splash_screen/splash_screen.dart';
import 'ui/pages/onboarding_page/onboarding_page.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
      routes: {
        '/' :(context) => const SplashScreen(),
        '/onboarding' :(context) => const OnboardingPage(),
        '/login' :(context) => const LoginPage(),
        '/registration' :(context) => const RegistrationPage(),
        '/main' :(context) => const MainPage(),
        '/bengkelprostetik' :(context) => const ProstheticWorkshopPage(),
        '/disability' :(context) => const DisabilityPage(),
        '/createinformation':(context) => const CreateInformationPage(),
        '/faq' :(context) => const FaqPage(),
        '/about' :(context) => const AboutPage(),
        '/blank' :(context) => const BlankPage(),
      },
    );
  }
}
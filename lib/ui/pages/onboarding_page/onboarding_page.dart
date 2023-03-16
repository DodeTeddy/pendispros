import 'package:flutter/material.dart';
import 'package:tugas_akhir_app/ui/pages/onboarding_page/get_started_page.dart';
import 'first_onboarding_page.dart';
import 'second_onboarding_page.dart';
import 'third_onboarding_page.dart';
import 'widgets/dot.dart';
import 'widgets/login_text_button.dart';
import 'widgets/onboarding_button.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late PageController _pageController;
  int currentPage = 0;
  List<Widget> pageView = const [
    GetStartedPage(),
    FirstOnboardingPage(),
    SecondOnboardingPage(),
    ThirdOnboardingPage()
  ];

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (value) {
              setState(() {
                currentPage = value;
              });
            },
            itemCount: pageView.length,
            itemBuilder: (context, index) => pageView[index],
          ),
          Visibility(
            visible: currentPage == 3,
            child: LoginTextButton(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
              },
            )
          ),
          OnboardingButton(
            title: currentPage == 0 ? 'Get started' : currentPage == 3 ? 'Create account' : 'Continue',
            onTap: () {
              if (currentPage != 3) {
                _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
              }else{
                Navigator.pushNamedAndRemoveUntil(context, '/registration', (route) => false);
              }
            },
          ),
          Positioned(
            bottom: 30,
            child: Row(
              children: List.generate(
                pageView.length, (index) => Dot(
                  index: index,
                  currentPage: currentPage,
                )
              ),
            ),
          )
        ],
      )
    );
  }
}
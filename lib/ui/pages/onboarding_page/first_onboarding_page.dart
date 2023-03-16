import 'package:flutter/material.dart';

class FirstOnboardingPage extends StatelessWidget {
  const FirstOnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 12, right: 12, top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Register Yourself Easily',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Now people with disabilities\ncan easily register themselves from mobile.',
                style: TextStyle(
                  fontSize: 16
                ),
              ),
              const SizedBox(height: 50),
              Image.asset('assets/images/first_onboarding.png')
            ],
          ),
        ),
      ),
    );
  }
}
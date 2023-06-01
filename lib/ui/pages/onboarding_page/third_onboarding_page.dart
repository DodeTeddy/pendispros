import 'package:flutter/material.dart';

class ThirdOnboardingPage extends StatelessWidget {
  const ThirdOnboardingPage({super.key});

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
                'Mendapatkan Layanan Informasi Lebih Mudah',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 30),
              const Text(
                'Dengan mendaftarkan diri pada aplikasi ini\nanda akan lebih mudah mendapatkan informasi mengenai prostetik.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 50),
              Image.asset('assets/images/third_onboarding.png')
            ],
          ),
        ),
      ),
    );
  }
}

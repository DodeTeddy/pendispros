import 'package:flutter/material.dart';
import 'package:tugas_akhir_app/ui/shared/theme/constant.dart';
import 'package:google_fonts/google_fonts.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 12, right: 12, top: 60),
          child: Column(
            children: [
              Image.asset(
                'assets/images/get_started.png',
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 25,
                    color: primaryColor
                  ),
                  children: [
                    const TextSpan(
                      text: 'Welcome to '
                    ),
                    TextSpan(
                      text: appName,
                      style: TextStyle(
                        fontFamily: GoogleFonts.cedarvilleCursive().fontFamily
                      )
                    )
                  ]
                )
              ),
              const SizedBox(height: 20),
              const Text(
                'application registration for\npersons with disabilities and prosthetic workshops,\nto get information services easily',
                style: TextStyle(
                  fontSize: 15
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
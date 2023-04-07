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
              Text(
                appName,
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: GoogleFonts.cedarvilleCursive().fontFamily
                )
              ),
              const Text(
                'Selamat Datang',
                style: TextStyle(
                  fontSize: 25
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Aplikasi pendataan untuk penyandang disabilitas dan bengkel prostetik untuk mendapatkan informasi secara lebih mudah',
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
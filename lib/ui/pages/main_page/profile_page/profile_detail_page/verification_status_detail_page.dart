import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tugas_akhir_app/ui/pages/main_page/home_page/verification_page/verification_page.dart';
import 'package:tugas_akhir_app/ui/shared/theme/constant.dart';
import 'package:tugas_akhir_app/ui/shared/widgets/custom_appbar.dart';
import 'package:tugas_akhir_app/ui/shared/widgets/custom_container.dart';

class VerificationStatusDetailPage extends StatelessWidget {
  final String name;
  final String role;
  final String disability;
  final String verifiedAs;
  const VerificationStatusDetailPage({super.key, required this.name, required this.role, required this.disability, required this.verifiedAs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        child: Text('Verification Status')
      ),
      body: Column(
        children: [
          Visibility(
            visible: verifiedAs != 'notverified',
            child: CustomContainer(
              margin: const EdgeInsets.only(top: 20, left: 12, right: 12),
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/profile.svg'),
                      const SizedBox(width: 10),
                      Text(name, style: const TextStyle(fontSize: 20))
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const SizedBox(width: 35),
                      Text('Disabilitas pada $disability', style: const TextStyle(fontSize: 15)),
                    ],
                  )
                ],
              )
            ),
          ),
          CustomContainer(
            color: primaryColor,
            margin: const EdgeInsets.only(top: 10, left: 12, right: 12),
            padding: const EdgeInsets.all(20), 
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.pending_actions,
                  color: Colors.white,
                ),
                Text(
                  verifiedAs == 'notverified' ? 'Belum Terverifikasi' : 'Terverifikasi ${verifiedAs == 'disability' ? 'Penyandang Disabilitas' : 'Bengkel Prostetik'}',
                  style: const TextStyle(
                    color: Colors.white
                  ),
                ),
                Icon(
                  verifiedAs == 'notverified' ? Icons.cancel_outlined : Icons.beenhere_outlined,
                  color: Colors.white,
                ),
              ],
            )
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => VerificationPage(isDisability: role == 'disability'))),
            child: const Text('Klik disini untuk verifikasi', style: TextStyle(fontSize: 15))
          )
        ],
      ),
    );
  }
}
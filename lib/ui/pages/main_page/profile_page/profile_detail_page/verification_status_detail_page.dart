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
  const VerificationStatusDetailPage(
      {super.key,
      required this.name,
      required this.role,
      required this.disability,
      required this.verifiedAs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(child: Text('Status Verifikasi')),
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
                      Expanded(
                        child: Text(
                          name.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 20,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const SizedBox(width: 35),
                      Text(
                        role == 'disability'
                            ? 'Disabilitas pada $disability'
                            : role == 'prosthetic'
                                ? 'Bengkel Prostetik'
                                : 'Not Verified',
                        style: const TextStyle(fontSize: 15),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          CustomContainer(
            color: primaryColor,
            margin: const EdgeInsets.only(top: 10, left: 12, right: 12),
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 0),
                Text(
                  verifiedAs == 'notverified' || verifiedAs == 'waiting'
                      ? 'Belum Terverifikasi'
                      : 'Terverifikasi ${verifiedAs == 'disability' ? 'Penyandang Disabilitas' : 'Bengkel Prostetik'}',
                  style: const TextStyle(color: Colors.white),
                ),
                Icon(
                  verifiedAs == 'notverified' || verifiedAs == 'waiting'
                      ? Icons.cancel_outlined
                      : Icons.verified_outlined,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () => verifiedAs == 'notverified'
                ? Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VerificationPage(
                        isDisability: role == 'disability',
                        isWaiting: verifiedAs == 'waiting',
                      ),
                    ),
                  )
                : null,
            child: Text(
              verifiedAs == 'notverified' ? 'Klik disini untuk verifikasi' : '',
              style: const TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}

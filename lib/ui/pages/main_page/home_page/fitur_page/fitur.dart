import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:tugas_akhir_app/ui/shared/theme/constant.dart';

import '../verification_page/verification_page.dart';
import '../../widgets/fitur_icon.dart';

class FiturForAdminOrNotVer extends StatelessWidget {
  final bool isAdmin;
  final bool isDisabilty;
  final bool isProsthetic;
  final bool isNotVerified;
  final bool isWaiting;
  const FiturForAdminOrNotVer(
      {super.key,
      this.isAdmin = false,
      this.isDisabilty = false,
      this.isProsthetic = false,
      required this.isNotVerified,
      required this.isWaiting});

  void onTap(String navigation, BuildContext context) {
    if (isAdmin) {
      Navigator.pushNamed(context, navigation);
    } else if (isDisabilty) {
      if (isNotVerified) {
        QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            title: 'Oops...',
            text: 'Maaf, Kamu belum terverifikasi',
            customAsset: 'assets/images/get_started.png',
            confirmBtnColor: primaryColor,
            backgroundColor: secondaryColor);
      } else {
        Navigator.pushNamed(context, navigation);
      }
    } else {
      if (isNotVerified) {
        QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            title: 'Oops...',
            text: 'Maaf, Kamu belum terverifikasi',
            customAsset: 'assets/images/get_started.png',
            confirmBtnColor: primaryColor,
            backgroundColor: secondaryColor);
      } else if (!isNotVerified && isProsthetic) {
        Navigator.pushNamed(context, navigation);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isAdmin
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FiturIcon(
                      onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VerificationPage(
                                isDisability: true,
                                isAdmin: true,
                                isWaiting: isWaiting,
                              ),
                            ),
                          ),
                      asset: 'assets/images/disability.png',
                      title: 'Registrasi\nDisabiltas'),
                  FiturIcon(
                      onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VerificationPage(
                                isDisability: false,
                                isAdmin: true,
                                isWaiting: isWaiting,
                              ),
                            ),
                          ),
                      asset: 'assets/images/prosthetic.png',
                      title: 'Registrasi\nBengkel'),
                  FiturIcon(
                      onTap: () => onTap('/disabilityadmin', context),
                      asset: 'assets/images/disability_data.png',
                      title: 'Data\nDisabilitas'),
                  FiturIcon(
                      onTap: () => onTap('/prostheticworkshopadmin', context),
                      asset: 'assets/images/prosthetic_data.png',
                      title: 'Data\nBengkel'),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  isDisabilty
                      ? FiturIcon(
                          onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => VerificationPage(
                                    isDisability: isDisabilty,
                                    isWaiting: isWaiting,
                                  ),
                                ),
                              ),
                          asset: 'assets/images/disability.png',
                          title: 'Verifikasi\nDisabiltas')
                      : FiturIcon(
                          onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => VerificationPage(
                                    isDisability: isDisabilty,
                                    isWaiting: isWaiting,
                                  ),
                                ),
                              ),
                          asset: 'assets/images/prosthetic.png',
                          title: 'Verifikasi\nBengkel'),
                  FiturIcon(
                      onTap: () => onTap('/blank', context),
                      asset: 'assets/images/disability_data.png',
                      title: 'Data\nDisabilitas'),
                  FiturIcon(
                      onTap: () => onTap('/blank', context),
                      asset: 'assets/images/prosthetic_data.png',
                      title: 'Data\nProstetik'),
                  FiturIcon(
                      onTap: () => onTap('/blank', context),
                      asset: 'assets/images/information_service.png',
                      title: 'Layanan\nInformasi'),
                ],
              ),
        const SizedBox(height: 20),
        Row(
          children: [
            FiturIcon(
                onTap: () => onTap('/createinformation', context),
                asset: 'assets/images/information_service.png',
                title: 'Tambah\nInformasi'),
          ],
        ),
      ],
    );
  }
}

class FiturForDisability extends StatelessWidget {
  const FiturForDisability({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FiturIcon(
            onTap: () => Navigator.pushNamed(context, '/prostheticworkshop'),
            asset: 'assets/images/prosthetic_data.png',
            title: 'Data\nBengkel'),
        const SizedBox(width: 25),
        FiturIcon(
            onTap: () => Navigator.pushNamed(context, '/createinformation'),
            asset: 'assets/images/information_service.png',
            title: 'Tambah\nInformasi'),
      ],
    );
  }
}

class FiturForProstheticWs extends StatelessWidget {
  const FiturForProstheticWs({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FiturIcon(
            onTap: () => Navigator.pushNamed(context, '/disability'),
            asset: 'assets/images/disability_data.png',
            title: 'Data\nDisabilitas'),
        const SizedBox(width: 25),
        FiturIcon(
            onTap: () => Navigator.pushNamed(context, '/createinformation'),
            asset: 'assets/images/information_service.png',
            title: 'Tambah\nInformasi'),
      ],
    );
  }
}

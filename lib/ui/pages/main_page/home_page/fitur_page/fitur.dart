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
  const FiturForAdminOrNotVer({super.key, this.isAdmin = false, this.isDisabilty = false, this.isProsthetic = false, required this.isNotVerified});

  void onTap(String navigation, BuildContext context){
    if (isAdmin) {
      Navigator.pushNamed(context, navigation);
    }else if(isDisabilty){
      if (isNotVerified) {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          title: 'Oops...',
          text: 'Maaf, Kamu belum terverifikasi',
          customAsset: 'assets/images/get_started.png',
          confirmBtnColor: primaryColor,
          backgroundColor: secondaryColor
        );
      }else{
        Navigator.pushNamed(context, navigation);
      }
    }else{
      if (isNotVerified) {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          title: 'Oops...',
          text: 'Maaf, Kamu belum terverifikasi',
          customAsset: 'assets/images/get_started.png',
          confirmBtnColor: primaryColor,
          backgroundColor: secondaryColor
        );
      }else if(!isNotVerified && isProsthetic){
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
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => VerificationPage(isDisability: isDisabilty))),
              asset: 'assets/images/disability.png', 
              title: 'Verifikasi\nDisabiltas'
            ),
            FiturIcon(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => VerificationPage(isDisability: isDisabilty))),
              asset: 'assets/images/prosthetic.png', 
              title: 'Verifikasi Bengkel\nProstetik'
            ),
            FiturIcon(
              onTap: () => onTap('/blank', context),
              asset: 'assets/images/disability_data.png', 
              title: 'Penyandang\nDisabilitas'
            ),
            FiturIcon(
              onTap: () => onTap('/blank', context),
              asset: 'assets/images/prosthetic_data.png', 
              title: 'Data\nProstetik'
            ),
          ],
        )
        : Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            isDisabilty 
            ? FiturIcon(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => VerificationPage(isDisability: isDisabilty))),
              asset: 'assets/images/disability.png', 
              title: 'Verifikasi\nDisabiltas'
            )
            : FiturIcon(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => VerificationPage(isDisability: isDisabilty))),
              asset: 'assets/images/prosthetic.png', 
              title: 'Verifikasi\nBengkel'
            ),
            FiturIcon(
              onTap: () => onTap('/blank', context),
              asset: 'assets/images/disability_data.png', 
              title: 'Penyandang\nDisabilitas'
            ),
            FiturIcon(
              onTap: () => onTap('/blank', context),
              asset: 'assets/images/prosthetic_data.png', 
              title: 'Bengkel\nProstetik'
            ),
            FiturIcon(
              onTap: () => onTap('/blank', context),
              asset: 'assets/images/information_service.png', 
              title: 'Layanan\nInformasi'
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Visibility(
              visible: isAdmin,
              child: Container(
                margin: const EdgeInsets.only(right: 20),
                child: FiturIcon(
                  onTap: () => onTap('/blank', context),
                  asset: 'assets/images/information_service.png', 
                  title: 'Layanan\nInformasi'
                ),
              ),
            ),
            FiturIcon(
              onTap: () => onTap('/blank', context),
              asset: 'assets/images/third_onboarding.png', 
              title: 'Tambah\nInformasi'
            ),
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
          onTap: () => Navigator.pushNamed(context, '/bengkelprostetik'),
          asset: 'assets/images/prosthetic_data.png', 
          title: 'Bengkel\nProstetik'
        ),
        const SizedBox(width: 25),
        FiturIcon(
          onTap: () {
            
          },
          asset: 'assets/images/information_service.png', 
          title: 'Layanan\nInformasi'
        ),
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
          onTap: () {
            
          },
          asset: 'assets/images/disability_data.png', 
          title: 'Penyandang\nDisabilitas'
        ),
        const SizedBox(width: 25),
        FiturIcon(
          onTap: () {
            
          },
          asset: 'assets/images/information_service.png', 
          title: 'Layanan\nInformasi'
        ),
      ],
    );
  }
}
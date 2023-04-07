import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:tugas_akhir_app/ui/shared/theme/constant.dart';

import 'fitur_icon.dart';

class FiturForAdminOrNotVer extends StatelessWidget {
  final bool isAdmin;
  const FiturForAdminOrNotVer({super.key, required this.isAdmin});

  void onTap(String navigation, BuildContext context){
    if (isAdmin) {
      Navigator.pushNamed(context, navigation);
    }else{
      QuickAlert.show(
        context: context, 
        type: QuickAlertType.error,
        title: 'Oops...',
        text: 'Kamu belum melakukan verifikasi',
        confirmBtnText: 'Oke',
        confirmBtnColor: primaryColor,
        customAsset: 'assets/images/get_started.png'
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FiturIcon(
              onTap: () => onTap('/blank', context),
              asset: 'assets/images/disability.png', 
              title: 'Disability\nRegistration'
            ),
            FiturIcon(
              onTap: () => onTap('/blank', context),
              asset: 'assets/images/prosthetic.png', 
              title: 'Prosthetics\nRegistration'
            ),
            FiturIcon(
              onTap: () => onTap('/blank', context),
              asset: 'assets/images/information_service.png', 
              title: 'Information\nService'
            ),
            FiturIcon(
              onTap: () => onTap('/blank', context),
              asset: 'assets/images/third_onboarding.png', 
              title: 'Create\nInformation'
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FiturIcon(
              onTap: () => onTap('/blank', context),
              asset: 'assets/images/disability_data.png', 
              title: 'Disability\nData'
            ),
            FiturIcon(
              onTap: () => onTap('/blank', context),
              asset: 'assets/images/prosthetic_data.png', 
              title: 'Prosthetics\nData'
            ),
            const SizedBox(
              height: 50,
              width: 50,
            ),
            const SizedBox(
              height: 50,
              width: 50,
            ),
            const SizedBox(
              height: 50,
              width: 50,
            )
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FiturIcon(
          onTap: () {
            
          },
          asset: 'assets/images/disability.png', 
          title: 'Disability\nRegistration'
        ),
        FiturIcon(
          onTap: () {
            
          },
          asset: 'assets/images/prosthetic_data.png', 
          title: 'Prosthetics\nWorkshop'
        ),
        FiturIcon(
          onTap: () {
            
          },
          asset: 'assets/images/information_service.png', 
          title: 'Information\nService'
        ),
        const SizedBox(
          height: 50,
          width: 50,
        )
      ],
    );
  }
}

class FiturForProstheticWs extends StatelessWidget {
  const FiturForProstheticWs({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FiturIcon(
          onTap: () {
            
          },
          asset: 'assets/images/prosthetic.png', 
          title: 'Prosthetic\nRegistration'
        ),
        FiturIcon(
          onTap: () {
            
          },
          asset: 'assets/images/disability_data.png', 
          title: 'Disability\nData'
        ),
        FiturIcon(
          onTap: () {
            
          },
          asset: 'assets/images/information_service.png', 
          title: 'Information\nService'
        ),
        const SizedBox(
          height: 50,
          width: 50,
        )
      ],
    );
  }
}
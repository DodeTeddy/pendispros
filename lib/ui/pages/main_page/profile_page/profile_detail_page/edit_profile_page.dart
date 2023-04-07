import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tugas_akhir_app/ui/shared/widgets/custom_appbar.dart';
import 'package:tugas_akhir_app/ui/shared/widgets/custom_button.dart';
import 'package:tugas_akhir_app/ui/shared/widgets/custom_container.dart';

import '../../../../shared/theme/constant.dart';
import '../../../../shared/widgets/custom_textformfield.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: const CustomAppBar(
        child: Text('Edit Profile')
      ),
      body: Column(
        children: [
          CustomContainer(
            margin: const EdgeInsets.only(top: 20, left: 12, right: 12),
            padding: const EdgeInsets.all(20), 
            child: Column(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 3,
                        color: inActiveColor
                      )
                    ]
                  ),
                  child: SvgPicture.asset('assets/icons/profile.svg'),
                ),
                const SizedBox(height: 30),
                CustomTextFormField(
                  controller: controller, 
                  title: 'Nama Pengguna', 
                  onTap: () => null,
                ),
                CustomTextFormField(
                  controller: controller, 
                  title: 'Nama', 
                  onTap: () => null,
                ),
                CustomTextFormField(
                  controller: controller, 
                  title: 'Email', 
                  onTap: () => null,
                ),
                CustomTextFormField(
                  controller: controller, 
                  title: 'Nomor Telepon', 
                  onTap: () => null,
                ),
                const SizedBox(height: 10),
                CustomButton(
                  title: 'Simpan',
                  onTap: () => null,
                )
              ],
            )
          )
        ],
      )
    );
  }
}
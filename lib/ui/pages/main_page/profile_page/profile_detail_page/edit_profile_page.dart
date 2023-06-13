import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quickalert/quickalert.dart';
import 'package:tugas_akhir_app/models/edit_profile_model.dart';
import 'package:tugas_akhir_app/services/service.dart';
import 'package:tugas_akhir_app/ui/pages/main_page/main_page.dart';
import 'package:tugas_akhir_app/ui/shared/widgets/custom_appbar.dart';
import 'package:tugas_akhir_app/ui/shared/widgets/custom_button.dart';
import 'package:tugas_akhir_app/ui/shared/widgets/custom_container.dart';

import '../../../../shared/theme/constant.dart';
import '../../../../shared/widgets/custom_textformfield.dart';

class EditProfilePage extends StatefulWidget {
  final String username;
  final String name;
  final String email;
  final String phone;
  const EditProfilePage(
      {super.key,
      required this.username,
      required this.name,
      required this.email,
      required this.phone});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  void profileEdit() {
    if (usernameController.text.isNotEmpty &&
        nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        phoneController.text.isNotEmpty) {
      QuickAlert.show(
          title: 'Apakah anda yakin?',
          context: context,
          type: QuickAlertType.confirm,
          confirmBtnText: 'Ya',
          onConfirmBtnTap: () async {
            EditProfileModel editProfileModel = await editProfile(
                usernameController.text.isEmpty
                    ? widget.username
                    : usernameController.text,
                nameController.text.isEmpty ? widget.name : nameController.text,
                emailController.text.isEmpty
                    ? widget.email
                    : emailController.text,
                phoneController.text.isEmpty
                    ? widget.phone
                    : phoneController.text);
            if (editProfileModel.message == 'Update Success!') {
              if (!mounted) return;
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Update profile berhasil!'),
                backgroundColor: Colors.green,
                behavior: SnackBarBehavior.floating,
              ));
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const MainPage(page: 2,)), (route) => false);
            }
          },
          cancelBtnText: 'Tidak',
          confirmBtnColor: primaryColor,
          customAsset: 'assets/images/get_started.png',
          backgroundColor: secondaryColor);
    }
  }

  @override
  void initState() {
    usernameController.text = widget.username;
    nameController.text = widget.name;
    emailController.text = widget.email;
    phoneController.text = widget.phone;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(child: Text('Edit Profile')),
        body: ListView(
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
                            BoxShadow(blurRadius: 3, color: inActiveColor)
                          ]),
                      child: SvgPicture.asset('assets/icons/profile.svg'),
                    ),
                    const SizedBox(height: 30),
                    CustomTextFormField(
                      controller: usernameController,
                      title: 'Nama Pengguna',
                      onTap: () => null,
                    ),
                    CustomTextFormField(
                      controller: nameController,
                      title: 'Nama',
                      onTap: () => null,
                    ),
                    CustomTextFormField(
                      controller: emailController,
                      title: 'Email',
                      onTap: () => null,
                    ),
                    CustomTextFormField(
                      isNumberField: true,
                      controller: phoneController,
                      title: 'Nomor Telepon',
                      onTap: () => null,
                    ),
                    const SizedBox(height: 10),
                    CustomButton(title: 'Simpan', onTap: profileEdit)
                  ],
                ))
          ],
        ));
  }
}

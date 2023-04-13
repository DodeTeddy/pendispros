import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:tugas_akhir_app/ui/shared/theme/constant.dart';
import 'package:tugas_akhir_app/ui/shared/widgets/custom_appbar.dart';
import 'package:tugas_akhir_app/ui/shared/widgets/custom_button.dart';
import 'package:tugas_akhir_app/ui/shared/widgets/custom_container.dart';

import '../../../../shared/widgets/custom_textformfield.dart';

class CreateInformationPage extends StatelessWidget {
  const CreateInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: const CustomAppBar(
        child: Text('Tambah Informasi')
      ),
      body: Column(
        children: [
          CustomContainer(
            margin: const EdgeInsets.only(left: 12, right: 12 ,top: 15),
            padding: const EdgeInsets.all(20), 
            child: Column(
              children: [
                CustomTextFormField(
                  controller: controller, 
                  title: 'Judul Informasi', 
                  onTap: () => null,
                ),
                CustomTextFormField(
                  isText: true,
                  controller: controller, 
                  title: 'Detail Informasi', 
                  onTap: () => null,
                ),
                const SizedBox(height: 10),
                CustomButton(
                  title: 'Tambah',
                  onTap: () => null,
                )
              ],
            )
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => CustomContainer(
                margin: const EdgeInsets.only(left: 12, right: 12 ,top: 10),
                padding: const EdgeInsets.all(10), 
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                        color: secondaryColor,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/logo_app.png')
                        )
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Text(
                        'Program 1000 Kaki Palsu',
                        style: TextStyle(
                          fontWeight: FontWeight.w600
                        ),
                      )
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => QuickAlert.show(
                            title: '',
                            context: context,
                            type: QuickAlertType.confirm,
                            confirmBtnText: 'Ya',
                            widget: Column(
                              children: [
                                CustomTextFormField(
                                  isOnAlert: true,
                                  controller: controller, 
                                  title: 'Judul Informasi', 
                                  onTap: () => null,
                                ),
                                CustomTextFormField(
                                  isOnAlert: true,
                                  isText: true,
                                  controller: controller, 
                                  title: 'Detail Informasi', 
                                  onTap: () => null,
                                )
                              ],
                            ),
                            onConfirmBtnTap: (){
                              Navigator.pop(context);
                            },
                            cancelBtnText: 'Tidak',
                            confirmBtnColor: primaryColor,
                            customAsset: 'assets/images/get_started.png',
                            backgroundColor: secondaryColor
                          ),
                          icon: const Icon(Icons.edit, color: primaryColor, size: 25),
                        ),
                        IconButton(
                          onPressed: () => QuickAlert.show(
                            title: 'Apakah anda yakin?',
                            context: context,
                            type: QuickAlertType.confirm,
                            confirmBtnText: 'Ya',
                            onConfirmBtnTap: (){
                              Navigator.pop(context);
                            },
                            cancelBtnText: 'Tidak',
                            confirmBtnColor: primaryColor,
                            customAsset: 'assets/images/get_started.png',
                            backgroundColor: secondaryColor
                          ),
                          icon: const Icon(Icons.delete_outline_rounded, color: primaryColor, size: 30),
                        ),
                      ],
                    )
                  ],
                )
              ),
            ),
          )
        ],
      ),
    );
  }
}
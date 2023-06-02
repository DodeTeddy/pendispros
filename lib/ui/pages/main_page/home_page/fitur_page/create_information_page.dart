import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:tugas_akhir_app/models/create_information_model.dart';
import 'package:tugas_akhir_app/models/delete_information_model.dart';
import 'package:tugas_akhir_app/models/update_information_model.dart';
import 'package:tugas_akhir_app/services/service.dart';
import 'package:tugas_akhir_app/ui/pages/main_page/home_page/fitur_page/create_information_page_skeleton.dart';
import 'package:tugas_akhir_app/ui/shared/theme/constant.dart';
import 'package:tugas_akhir_app/ui/shared/widgets/custom_appbar.dart';
import 'package:tugas_akhir_app/ui/shared/widgets/custom_button.dart';
import 'package:tugas_akhir_app/ui/shared/widgets/custom_container.dart';

import '../../../../shared/widgets/custom_textformfield.dart';

class CreateInformationPage extends StatefulWidget {
  const CreateInformationPage({super.key});

  @override
  State<CreateInformationPage> createState() => _CreateInformationPageState();
}

class _CreateInformationPageState extends State<CreateInformationPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController detailController = TextEditingController();
  TextEditingController titleEditController = TextEditingController();
  TextEditingController detailEditController = TextEditingController();
  bool isLoading = false;

  void addData() async {
    if (titleController.text.isEmpty || detailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Kolom tidak boleh kosong'),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ));
    } else {
      CreateInformationModel createInformationModel =
          await createInformation(titleController.text, detailController.text);
      setState(() {
        isLoading = true;
      });
      if (createInformationModel.message == 'Create Information Success!') {
        setState(() {
          isLoading = false;
        });
        titleController.clear();
        detailController.clear();
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Berhasil menambah informasi'),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
        ));
      } else {
        setState(() {
          isLoading = false;
        });
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Gagal menambah informasi'),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ));
      }
    }
  }

  void updateData(int id) async {
    if (titleEditController.text.isEmpty || detailEditController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Kolom tidak boleh kosong'),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ));
    } else {
      UpdateInformationModel updateInformationModel = await updateInformation(
          titleEditController.text, detailEditController.text, id);
      if (updateInformationModel.message == 'Update Information Success!') {
        if (!mounted) return;
        setState(() {
          Navigator.pop(context);
        });
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Berhasil memperbarui informasi'),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
        ));
      } else {
        setState(() {
          Navigator.pop(context);
        });
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Gagal memperbarui informasi'),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ));
      }
    }
  }

  void deleteData(int id) async {
    DeleteInformationModel deleteInformationModel = await deleteInformation(id);
    if (deleteInformationModel.message == 'Delete Information Success!') {
      setState(() {
        Navigator.pop(context);
      });
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Berhasil menghapus informasi'),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
      ));
    } else {
      setState(() {
        Navigator.pop(context);
      });
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Gagal menghapus informasi'),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(child: Text('Tambah Informasi')),
      body: Column(
        children: [
          CustomContainer(
              margin: const EdgeInsets.only(left: 12, right: 12, top: 15),
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  CustomTextFormField(
                    controller: titleController,
                    title: 'Judul Informasi',
                    onTap: () => null,
                  ),
                  CustomTextFormField(
                    isText: true,
                    controller: detailController,
                    title: 'Detail Informasi',
                    onTap: () => null,
                  ),
                  const SizedBox(height: 10),
                  CustomButton(
                      isLoading: isLoading, title: 'Tambah', onTap: addData)
                ],
              )),
          StreamBuilder(
              stream: getInformation(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var information = snapshot.data!.data;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: information.length,
                      itemBuilder: (context, index) => CustomContainer(
                          margin: const EdgeInsets.only(
                              left: 12, right: 12, top: 10),
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
                                        image: AssetImage(
                                            'assets/images/logo_app.png'))),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      information[index].titleInformation,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      information[index].detailInformation,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      titleEditController.text =
                                          information[index].titleInformation;
                                      detailEditController.text =
                                          information[index].detailInformation;
                                      QuickAlert.show(
                                          title: '',
                                          context: context,
                                          type: QuickAlertType.confirm,
                                          confirmBtnText: 'Ya',
                                          widget: Column(
                                            children: [
                                              CustomTextFormField(
                                                isOnAlert: true,
                                                controller: titleEditController,
                                                title: 'Judul Informasi',
                                                onTap: () => null,
                                              ),
                                              CustomTextFormField(
                                                isOnAlert: true,
                                                isText: true,
                                                controller:
                                                    detailEditController,
                                                title: 'Detail Informasi',
                                                onTap: () => null,
                                              )
                                            ],
                                          ),
                                          onConfirmBtnTap: () =>
                                              updateData(information[index].id),
                                          cancelBtnText: 'Tidak',
                                          confirmBtnColor: primaryColor,
                                          customAsset:
                                              'assets/images/get_started.png',
                                          backgroundColor: secondaryColor);
                                    },
                                    icon: const Icon(Icons.edit,
                                        color: primaryColor, size: 25),
                                  ),
                                  IconButton(
                                    onPressed: () => QuickAlert.show(
                                        title: 'Apakah anda yakin?',
                                        context: context,
                                        type: QuickAlertType.confirm,
                                        confirmBtnText: 'Ya',
                                        onConfirmBtnTap: () =>
                                            deleteData(information[index].id),
                                        cancelBtnText: 'Tidak',
                                        confirmBtnColor: primaryColor,
                                        customAsset:
                                            'assets/images/get_started.png',
                                        backgroundColor: secondaryColor),
                                    icon: const Icon(
                                        Icons.delete_outline_rounded,
                                        color: primaryColor,
                                        size: 30),
                                  ),
                                ],
                              )
                            ],
                          )),
                    ),
                  );
                } else {
                  return const CreateInformationPageSkeleton();
                }
              })
        ],
      ),
    );
  }
}

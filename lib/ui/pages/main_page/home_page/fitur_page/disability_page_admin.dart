import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:tugas_akhir_app/services/service.dart';
import 'package:tugas_akhir_app/ui/pages/main_page/home_page/fitur_page/disability_page_skeleton.dart';
import 'package:tugas_akhir_app/ui/pages/main_page/home_page/fitur_page/update_page/update_disabilityy_page.dart';
import 'package:tugas_akhir_app/ui/shared/widgets/custom_appbar.dart';
// import 'package:tugas_akhir_app/ui/shared/widgets/custom_button.dart';
// import 'package:tugas_akhir_app/ui/shared/widgets/custom_drawer.dart';
import 'package:tugas_akhir_app/ui/shared/widgets/custom_text.dart';

import '../../../../../models/delete_dsandws_model.dart';
import '../../../../shared/theme/constant.dart';
import '../../../../shared/widgets/custom_container.dart';
import '../../../../shared/widgets/profile_item.dart';

class DisabilityPageAdmin extends StatefulWidget {
  const DisabilityPageAdmin({super.key});

  @override
  State<DisabilityPageAdmin> createState() => _DisabilityPageAdminState();
}

class _DisabilityPageAdminState extends State<DisabilityPageAdmin> {
  void deleteData(int id) async {
    DeleteDsAndWsModel deleteDsAndWsModel = await deleteDisability(id);
    if (deleteDsAndWsModel.message == 'Delete Success!') {
      setState(() {
        Navigator.pop(context);
      });
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Berhasil menghapus Data'),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
      ));
    } else {
      setState(() {
        Navigator.pop(context);
      });
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Gagal menghapus Data'),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ));
    }
  }
  bool handPick = false;
  bool footPick = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        child: Text('Data Penyandang Disabilitas')
      ),
      // endDrawer: Drawer(
      //   child: SafeArea(
      //     child: Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 10),
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           const Text(
      //             'Disabilitas',
      //             style: TextStyle(
      //               fontSize: 20
      //             ),
      //           ),
      //           const SizedBox(height: 10),
      //           Row(
      //             children: [
      //               Expanded(
      //                 child: CustomDrawer( 
      //                   isPick: handPick,
      //                   onTap: () {
      //                     setState(() {
      //                       handPick = !handPick;
      //                       footPick = !handPick;
      //                     });
      //                   },
      //                   text: 'Tangan'
      //                 ),
      //               ),
      //               const SizedBox(width: 10),
      //               Expanded(
      //                 child: CustomDrawer(
      //                   isPick: footPick,
      //                   onTap: () {
      //                     setState(() {
      //                       footPick = !footPick;
      //                       handPick = !footPick;
      //                     });
      //                   },
      //                   text: 'Kaki'
      //                 ),
      //               ),
      //             ],
      //           ),
      //           const SizedBox(height: 30),
      //           CustomButton(
      //             onTap: () {
                    
      //             },
      //           )
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
      // appBar: AppBar(
      //   backgroundColor: primaryColor,
      //   shape: const RoundedRectangleBorder(
      //     borderRadius: BorderRadius.only(
      //       bottomLeft: Radius.circular(20),
      //       bottomRight: Radius.circular(20)
      //     )
      //   ),
      //   actions: [
      //     Builder(
      //       builder: (context) => IconButton(
      //         icon: const Icon(Icons.filter_alt_outlined),
      //         onPressed: () => Scaffold.of(context).openEndDrawer(),
      //         tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      //       ),
      //     ),
      //   ],
      //   title: const Text('Data Penyandang Disabilitas'),
      // ),
      body: StreamBuilder(
        stream: getDataDisability(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var getDataDs = snapshot.data!.data;
            return getDataDs.data.isEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/logo_app.png',
                          scale: 8,
                        ),
                        Text(
                          appName,
                          style: TextStyle(
                              fontFamily: GoogleFonts.cedarvilleCursive()
                                  .fontFamily,
                              fontSize: 40,
                              color: primaryColor),
                        )
                      ],
                    ),
                    const Text(
                      'Tidak ada data!',
                      style: TextStyle(fontSize: 20, color: primaryColor),
                    )
                  ],
                )
              : ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: getDataDs.data.length,
                  itemBuilder: (context, index) => CustomContainer(
                    margin: const EdgeInsets.symmetric(
                        vertical: 5, horizontal: 12),
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                            color: secondaryColor,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/logo_app.png')),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Text(
                                  getDataDs.data[index].name
                                      .capitalize(),
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                  overflow: TextOverflow.ellipsis),
                              const SizedBox(height: 5),
                              CustomText(
                                lable: 'Umur', value: '${getDataDs.data[index].age.toString()} Tahun'
                              ),
                              CustomText(
                                lable: 'Disabilitas', value: getDataDs.data[index].disability
                              ),
                              CustomText(
                                lable: 'Kanan', value: getDataDs.data[index].jenisAmputasiKanan
                              ),
                              CustomText(
                                lable: 'Kiri', value: getDataDs.data[index].jenisAmputasiKiri
                              ),
                              CustomText(
                                lable: 'Prostetik Dibutuhkan', value: getDataDs.data[index].jenisProstetik
                              ),
                              const SizedBox(height: 10),
                              ProfileItem(
                                  icon: Icons.call,
                                  text: getDataDs
                                      .data[index].phoneNumber),
                              const SizedBox(height: 10),
                              ProfileItem(
                                  icon: getDataDs.data[index].user
                                              .username ==
                                          'admin'
                                      ? Icons.check_circle_rounded
                                      : Icons.email_rounded,
                                  text: getDataDs.data[index].user
                                              .username ==
                                          'admin'
                                      ? 'registrasi oleh admin'
                                      : getDataDs
                                          .data[index].user.email),
                              const SizedBox(height: 10),
                              ProfileItem(
                                icon: Icons.pin_drop_rounded,
                                text:
                                    '${getDataDs.data[index].address}, ${getDataDs.data[index].city.name},\n${getDataDs.data[index].province.provinceName}-Indonesia',
                              )
                            ],
                          ),
                        ),
                        if(getDataDs.data[index].user.username == 'admin') Column(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateDisabilityPage(
                                  id: getDataDs.data[index].id.toString(), 
                                  name: getDataDs.data[index].name, 
                                  age: getDataDs.data[index].age.toString(), 
                                  phone: getDataDs.data[index].phoneNumber, 
                                  address: getDataDs.data[index].address,
                                )
                                  )
                                );
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
                                  onConfirmBtnTap: () => deleteData(
                                      getDataDs.data[index].id),
                                  cancelBtnText: 'Tidak',
                                  confirmBtnColor: primaryColor,
                                  customAsset:
                                      'assets/images/get_started.png',
                                  backgroundColor: secondaryColor),
                              icon: const Icon(
                                  Icons.delete_outline_rounded,
                                  color: primaryColor,
                                  size: 30),
                            )
                          ],
                        )
                      ],
                    )
                  ),
                );
          }
          return const DisabilityPageSkeleton();
        }
      )
    );
  }
}

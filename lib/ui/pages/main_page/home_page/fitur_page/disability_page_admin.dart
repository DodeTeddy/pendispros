import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas_akhir_app/services/service.dart';
import 'package:tugas_akhir_app/ui/pages/main_page/home_page/fitur_page/disability_page_skeleton.dart';
import 'package:tugas_akhir_app/ui/pages/main_page/home_page/fitur_page/update_page/update_disabilityy_page.dart';
import 'package:tugas_akhir_app/ui/shared/widgets/custom_appbar.dart';
// import 'package:tugas_akhir_app/ui/shared/widgets/custom_button.dart';
// import 'package:tugas_akhir_app/ui/shared/widgets/custom_drawer.dart';
import 'package:tugas_akhir_app/ui/shared/widgets/custom_text.dart';
import 'package:http/http.dart' as http;
import '../../../../../models/delete_dsandws_model.dart';
import '../../../../../models/get_disability_data_model.dart';
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

  List<Datum> listData = [];
  late Future<List<Datum>> _future;

  Future<List<Datum>> getDataDisability() async {
    var prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var url = Uri.parse('$baseUrl/disability');
    var header = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    try {
      var response = await http.get(url, headers: header);
      GetDisabilityDataModel getData =
          GetDisabilityDataModel.fromJson(jsonDecode(response.body));
      listData.addAll(getData.data.data);
      return listData;
    } catch (e) {
      rethrow;
    }
  }

  @override
  void initState() {
    _future = getDataDisability();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        child: Text('Data Penyandang Disabilitas'),
      ),
      body: FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var getDataDs = snapshot.data!;
            return getDataDs.isEmpty
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
                                fontFamily:
                                    GoogleFonts.cedarvilleCursive().fontFamily,
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
                    itemCount: getDataDs.length,
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
                                  image:
                                      AssetImage('assets/images/logo_app.png')),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  getDataDs[index].name.capitalize(),
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 5),
                                CustomText(
                                    lable: 'Umur',
                                    value:
                                        '${getDataDs[index].age.toString()} Tahun'),
                                CustomText(
                                    lable: 'Disabilitas',
                                    value: getDataDs[index].disability),
                                CustomText(
                                    lable: 'Kanan',
                                    value: getDataDs[index].jenisAmputasiKanan),
                                CustomText(
                                    lable: 'Kiri',
                                    value: getDataDs[index].jenisAmputasiKiri),
                                CustomText(
                                    lable: 'Prostetik Dibutuhkan',
                                    value: getDataDs[index].jenisProstetik),
                                const SizedBox(height: 10),
                                ProfileItem(
                                    icon: Icons.call,
                                    text: getDataDs[index].phoneNumber),
                                const SizedBox(height: 10),
                                ProfileItem(
                                    icon: getDataDs[index].user.username ==
                                            'admin'
                                        ? Icons.check_circle_rounded
                                        : Icons.email_rounded,
                                    text: getDataDs[index].user.username ==
                                            'admin'
                                        ? 'registrasi oleh admin'
                                        : getDataDs[index].user.email),
                                const SizedBox(height: 10),
                                ProfileItem(
                                  icon: Icons.pin_drop_rounded,
                                  text:
                                      '${getDataDs[index].address}, ${getDataDs[index].city.name},\n${getDataDs[index].province.provinceName}-Indonesia',
                                )
                              ],
                            ),
                          ),
                          if (getDataDs[index].user.username == 'admin')
                            Column(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            UpdateDisabilityPage(
                                          id: getDataDs[index].id.toString(),
                                          name: getDataDs[index].name,
                                          age: getDataDs[index].age.toString(),
                                          phone: getDataDs[index].phoneNumber,
                                          address: getDataDs[index].address,
                                          disabilityDdItem:
                                              getDataDs[index].disability,
                                          rightDisabilityDdItem:
                                              getDataDs[index]
                                                  .jenisAmputasiKanan,
                                          leftDisabilityDdItem: getDataDs[index]
                                              .jenisAmputasiKiri,
                                          prostheticDisabilityDdItem:
                                              getDataDs[index].jenisProstetik,
                                        ),
                                      ),
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
                                      onConfirmBtnTap: () =>
                                          deleteData(getDataDs[index].id),
                                      cancelBtnText: 'Tidak',
                                      confirmBtnColor: primaryColor,
                                      customAsset:
                                          'assets/images/get_started.png',
                                      backgroundColor: secondaryColor),
                                  icon: const Icon(Icons.delete_outline_rounded,
                                      color: primaryColor, size: 30),
                                )
                              ],
                            )
                        ],
                      ),
                    ),
                  );
          }
          return const DisabilityPageSkeleton();
        },
      ),
    );
  }
}

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
   
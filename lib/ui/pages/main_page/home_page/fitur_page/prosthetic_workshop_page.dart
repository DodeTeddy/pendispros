import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas_akhir_app/services/service.dart';
import 'package:tugas_akhir_app/ui/pages/main_page/home_page/fitur_page/prosthetic_workshop_page_skeleton.dart';
import 'package:http/http.dart' as http;
import '../../../../../models/delete_dsandws_model.dart';
import '../../../../../models/get_workshop_data_model.dart';
import '../../../../shared/theme/constant.dart';
import '../../../../shared/widgets/custom_appbar.dart';
import '../../../../shared/widgets/custom_container.dart';
import '../../../../shared/widgets/custom_search.dart';
import '../../../../shared/widgets/profile_item.dart';

class ProstheticWorkshopPage extends StatefulWidget {
  const ProstheticWorkshopPage({super.key});

  @override
  State<ProstheticWorkshopPage> createState() => _ProstheticWorkshopPageState();
}

class _ProstheticWorkshopPageState extends State<ProstheticWorkshopPage> {
  List image = [
    'assets/images/catalog1.jpg',
    'assets/images/catalog2.jpg',
    'assets/images/catalog3.jpg',
    'assets/images/catalog4.jpg'
  ];

  void deleteData(int id) async {
    DeleteDsAndWsModel deleteDsAndWsModel = await deleteProsthetic(id);
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

  List<Datum> listData = [];
  String searching = '';

  Future<List<Datum>> getDataWorkshop(String search) async {
    var prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var url = Uri.parse('$baseUrl/workshop?search=$search');
    var header = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    try {
      var response = await http.get(url, headers: header);
      GetWorkshopDataModel getData =
          GetWorkshopDataModel.fromJson(jsonDecode(response.body));
      listData.clear();
      listData.addAll(getData.data);
      return listData.reversed.toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          child: Padding(
            padding: EdgeInsets.only(left: 30),
            child: Text('Data Bengkel Prostetik'),
          ),
        ),
        body: FutureBuilder(
            future: getDataWorkshop(searching),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var getDataWs = snapshot.data!;
                return Stack(
                  children: [
                    if (getDataWs.isEmpty)
                      Column(
                        children: [
                          Expanded(
                            child: Column(
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
                                            GoogleFonts.cedarvilleCursive()
                                                .fontFamily,
                                        fontSize: 40,
                                        color: primaryColor,
                                      ),
                                    )
                                  ],
                                ),
                                const Text(
                                  'Tidak ada data!',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: primaryColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ListView.builder(
                      padding: const EdgeInsets.only(top: 60),
                      physics: const BouncingScrollPhysics(),
                      itemCount: getDataWs.length,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          QuickAlert.show(
                            context: context,
                            type: QuickAlertType.custom,
                            backgroundColor: secondaryColor,
                            confirmBtnColor: primaryColor,
                            customAsset: 'assets/images/get_started.png',
                            title: 'Katalog Bengkel Prostetik',
                            widget: SizedBox(
                              height: 200,
                              child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithMaxCrossAxisExtent(
                                        maxCrossAxisExtent: 200,
                                        childAspectRatio: 3 / 2,
                                        crossAxisSpacing: 20,
                                        mainAxisSpacing: 20),
                                itemCount: image.length,
                                itemBuilder: (context, index) => Container(
                                  decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        image[index],
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        child: CustomContainer(
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        getDataWs[index]
                                            .workshopName
                                            .capitalize(),
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                        overflow: TextOverflow.ellipsis),
                                    const SizedBox(height: 10),
                                    ProfileItem(
                                        icon: Icons.call,
                                        text: getDataWs[index].phoneNumber),
                                    const SizedBox(height: 10),
                                    ProfileItem(
                                        icon: getDataWs[index].user.username ==
                                                'admin'
                                            ? Icons.check_circle_rounded
                                            : Icons.email_rounded,
                                        text: getDataWs[index].user.username ==
                                                'admin'
                                            ? 'registrasi oleh admin'
                                            : getDataWs[index].user.email),
                                    const SizedBox(height: 10),
                                    ProfileItem(
                                      icon: Icons.pin_drop_rounded,
                                      text:
                                          '${getDataWs[index].address}, ${getDataWs[index].city.name},\n${getDataWs[index].province.provinceName}-Indonesia',
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    CustomSearch(
                      onChanged: (value) {
                        searching = value;
                        setState(() {
                          getDataWorkshop(searching);
                        });
                      },
                    )
                  ],
                );
              }
              return const ProstheticWorkshopPageSkeleton();
            }));
  }
}

        //   endDrawer: Drawer(),
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
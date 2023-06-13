import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugas_akhir_app/services/service.dart';
import 'package:tugas_akhir_app/ui/pages/main_page/home_page/fitur_page/disability_page_skeleton.dart';

import '../../../../../models/delete_dsandws_model.dart';
import '../../../../shared/theme/constant.dart';
import '../../../../shared/widgets/custom_appbar.dart';
import '../../../../shared/widgets/custom_container.dart';
import '../../../../shared/widgets/custom_text.dart';
import '../../../../shared/widgets/profile_item.dart';

class DisabilityPage extends StatefulWidget {
  const DisabilityPage({super.key});

  @override
  State<DisabilityPage> createState() => _DisabilityPageState();
}

class _DisabilityPageState extends State<DisabilityPage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
        child: Text('Data Penyandang Disabilitas')
      ),
        // endDrawer: Drawer(),
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
                              ],
                            )),
                      );
              }
              return const DisabilityPageSkeleton();
            }));
  }
}

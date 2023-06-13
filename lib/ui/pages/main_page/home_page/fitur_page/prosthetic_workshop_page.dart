import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugas_akhir_app/services/service.dart';
import 'package:tugas_akhir_app/ui/pages/main_page/home_page/fitur_page/prosthetic_workshop_page_skeleton.dart';

import '../../../../../models/delete_dsandws_model.dart';
import '../../../../shared/theme/constant.dart';
import '../../../../shared/widgets/custom_appbar.dart';
import '../../../../shared/widgets/custom_container.dart';
import '../../../../shared/widgets/profile_item.dart';

class ProstheticWorkshopPage extends StatefulWidget {
  const ProstheticWorkshopPage({super.key});

  @override
  State<ProstheticWorkshopPage> createState() => _ProstheticWorkshopPageState();
}

class _ProstheticWorkshopPageState extends State<ProstheticWorkshopPage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        child: Text('Data Bengkel Prostetik')
      ),
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
        body: StreamBuilder(
            stream: getDataWorkshop(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var getDataWs = snapshot.data!.data;
                return getDataWs.data.isEmpty
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
                        itemCount: getDataWs.data.length,
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
                                          getDataWs.data[index].workshopName
                                              .capitalize(),
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600),
                                          overflow: TextOverflow.ellipsis),
                                      const SizedBox(height: 10),
                                      ProfileItem(
                                          icon: Icons.call,
                                          text: getDataWs
                                              .data[index].phoneNumber),
                                      const SizedBox(height: 10),
                                      ProfileItem(
                                          icon: getDataWs.data[index].user
                                                      .username ==
                                                  'admin'
                                              ? Icons.check_circle_rounded
                                              : Icons.email_rounded,
                                          text: getDataWs.data[index].user
                                                      .username ==
                                                  'admin'
                                              ? 'registrasi oleh admin'
                                              : getDataWs
                                                  .data[index].user.email),
                                      const SizedBox(height: 10),
                                      ProfileItem(
                                        icon: Icons.pin_drop_rounded,
                                        text:
                                            '${getDataWs.data[index].address}, ${getDataWs.data[index].city.name},\n${getDataWs.data[index].province.provinceName}-Indonesia',
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      );
              }
              return const ProstheticWorkshopPageSkeleton();
            }));
  }
}

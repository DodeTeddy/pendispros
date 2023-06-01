import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:tugas_akhir_app/services/service.dart';
import 'package:tugas_akhir_app/ui/shared/widgets/custom_appbar.dart';

import '../../../../../models/delete_dsandws_model.dart';
import '../../../../shared/theme/constant.dart';
import '../../../../shared/widgets/custom_container.dart';
import '../../../../shared/widgets/profile_item.dart';
import 'update_page/update_prosthetic_page.dart';

class ProstheticWorkshopPageAdmin extends StatefulWidget {
  const ProstheticWorkshopPageAdmin({super.key});

  @override
  State<ProstheticWorkshopPageAdmin> createState() => _ProstheticWorkshopPageAdminState();
}

class _ProstheticWorkshopPageAdminState extends State<ProstheticWorkshopPageAdmin> {
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
        appBar: const CustomAppBar(child: Text('Data Bengkel Prostetik')),
        body: StreamBuilder(
            stream: getDataWorkshop(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var getDataWs = snapshot.data;
                return getDataWs!.data.isEmpty
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
                                if(getDataWs.data[index].user.username == 'admin') Column(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    UpdateProstheticPage(
                                                        id: getDataWs
                                                            .data[index].id,
                                                        name: getDataWs
                                                            .data[index]
                                                            .workshopName,
                                                        phone: getDataWs
                                                            .data[index]
                                                            .phoneNumber,
                                                        address: getDataWs
                                                            .data[index]
                                                            .address)));
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
                                              getDataWs.data[index].id),
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
                            )),
                      );
              }
              return const Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                ),
              );
            }));
  }
}

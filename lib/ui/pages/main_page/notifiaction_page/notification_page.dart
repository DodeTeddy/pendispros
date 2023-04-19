import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:tugas_akhir_app/services/service.dart';
import 'package:tugas_akhir_app/ui/shared/theme/constant.dart';
import 'package:tugas_akhir_app/ui/shared/widgets/custom_container.dart';

import '../../../shared/widgets/custom_appbar.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        isBack: false,
        child: Text('Notifikasi')
      ),
      body: FutureBuilder(
        future: getNotification(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var notification = snapshot.data!.data;
            return notification.isEmpty
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
                        fontFamily: GoogleFonts.cedarvilleCursive().fontFamily,
                        fontSize: 40,
                        color: primaryColor
                      ),
                    )
                  ],
                ),
                const Text(
                  'Tidak ada data!',
                  style: TextStyle(
                    fontSize: 20,
                    color: primaryColor
                  ),
                )
              ],
            )
            : ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: notification.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: (){
                  QuickAlert.show(
                    context: context, 
                    type: QuickAlertType.custom,
                    backgroundColor: secondaryColor,
                    confirmBtnColor: primaryColor,
                    customAsset: 'assets/images/get_started.png',
                    widget: SizedBox(
                      height: 200,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Text(
                              notification[index].titleInformation.capitalize(),
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(notification[index].detailInformation.capitalize())
                          ],
                        ),
                      ),
                    )
                  );
                },
                child: CustomContainer(
                  margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                  padding: const EdgeInsets.all(12), 
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                          color: secondaryColor,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/images/logo_app.png')
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              notification[index].titleInformation.capitalize(),
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600
                              ),
                              overflow: TextOverflow.ellipsis
                            ),
                            const SizedBox(height: 10),
                            Text(
                              notification[index].detailInformation.capitalize(),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            const SizedBox(height: 10),
                            Container(
                              height: 100,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: secondaryColor,
                                image: const DecorationImage(
                                  image: AssetImage('assets/images/logo_app.png')
                                )
                              ),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Create By ${notification[index].user.username.capitalize()}',
                                  style: const TextStyle(
                                    color: inActiveColor
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ),
              ),
            );
          }else{
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Center(
                  child: CircularProgressIndicator(
                    color: primaryColor,
                  )
                ),
              ],
            );
          }
        }
      )
    );
  }
}
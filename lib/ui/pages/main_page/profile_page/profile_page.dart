import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quickalert/quickalert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas_akhir_app/models/logout_model.dart';
import 'package:tugas_akhir_app/services/service.dart';
import 'package:tugas_akhir_app/ui/pages/main_page/profile_page/profile_detail_page/edit_profile_page.dart';
import 'package:tugas_akhir_app/ui/pages/main_page/profile_page/profile_detail_page/verification_status_detail_page.dart';
import 'package:tugas_akhir_app/ui/shared/widgets/custom_container.dart';

import '../../../shared/theme/constant.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_item.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    List<String> profileTextItem = ['FAQ', 'Tentang'];
    List<Widget> profileiconItem = [
      const Icon(Icons.question_answer_outlined, color: primaryColor),
      const Icon(Icons.book_outlined, color: primaryColor)
    ];
    List<String> routeName = ['/faq', '/about'];

    void logOut(){
      QuickAlert.show(
        title: 'Apakah anda yakin?',
        context: context,
        type: QuickAlertType.confirm,
        confirmBtnText: 'Ya',
        onConfirmBtnTap: ()async{
          final prefs = await SharedPreferences.getInstance();
          prefs.setBool('isLogin', false);
          var token = prefs.getString('token');
          LogoutModel logoutModel = await logout(token!);
          if (!mounted) return;
          if (logoutModel.message == 'Logout Success!') {
            prefs.remove('token');
            Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
          }
        },
        cancelBtnText: 'Tidak',
        confirmBtnColor: primaryColor,
        customAsset: 'assets/images/get_started.png',
        backgroundColor: secondaryColor
      );
    }
    return Scaffold(
      body: FutureBuilder(
        future: profileDetail(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {  
            var profileData = snapshot.data;
            return SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Profil',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      const SizedBox(height: 15),
                      CustomContainer(
                        padding: const EdgeInsets.all(12), 
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  ProfileHeader(
                                    text: profileData!.username.capitalize()
                                  ),
                                  const SizedBox(height: 10),
                                  Visibility(
                                    visible: profileData.verifiedAs != 'admin',
                                    child: ProfileItem(
                                      icon: Icons.call, 
                                      text: profileData.phone.isEmpty ? '-' : profileData.phone
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  ProfileItem(
                                    icon: Icons.pending_actions, 
                                    text: profileData.verifiedAs == 'disability' ? 'Terverifikasi Disabilitas' : profileData.verifiedAs == 'prosthetic' ? 'Terverifikasi Bengkel Prostetik' : profileData.verifiedAs == 'admin' ? 'Admin' : 'Belum Terverifikasi',
                                    textColor: profileData.verifiedAs == 'disability' || profileData.verifiedAs == 'prosthetic' ? primaryColor : inActiveColor,
                                  )
                                ],
                              ),
                            ),
                            Visibility(
                              visible: profileData.verifiedAs != 'admin',
                              child: IconButton(
                                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfilePage(
                                  username: profileData.username, name: profileData.name, email: profileData.email, phone: profileData.phone))
                                ), 
                                icon: const Icon(
                                  Icons.edit,
                                  color: primaryColor,
                                )
                              ),
                            )
                          ],
                        )
                      ),
                      const SizedBox(height: 20),
                      Visibility(
                        visible: profileData.verifiedAs != 'admin',
                        child: GestureDetector(
                          onTap: () => Navigator.push(context, MaterialPageRoute(
                            builder: (context) => VerificationStatusDetailPage(name: profileData.name, role: profileData.role ,disability: profileData.disability, verifiedAs: profileData.verifiedAs
                          ))),
                          child: CustomContainer(
                            color: primaryColor,
                            padding: const EdgeInsets.all(20), 
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Detail status verifikasi',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15
                                      ),
                                    ),
                                    Container(
                                      height: 35,
                                      width: 35,
                                      decoration: const BoxDecoration(
                                        color: secondaryColor,
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: AssetImage('assets/images/logo_app.png')
                                        )
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 15),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        profileData.name.isEmpty ? '-' : profileData.name.toUpperCase(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 15
                                        ),
                                      ),
                                    ),
                                    SvgPicture.asset(
                                      'assets/icons/arrow_right.svg',
                                      colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                                      height: 15,
                                    )
                                  ],
                                )
                              ],
                            )
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Informasi Umum',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      const SizedBox(height: 5),
                      CustomContainer(
                        padding: const EdgeInsets.all(12), 
                        child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () => Navigator.pushNamed(context, routeName[index]),
                            child: Container(
                              color: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        profileiconItem[index],
                                        const SizedBox(width: 10),
                                        Text(
                                          profileTextItem[index],
                                          style: const TextStyle(
                                            fontSize: 18
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SvgPicture.asset(
                                    'assets/icons/arrow_right.svg',
                                    colorFilter: const ColorFilter.mode(primaryColor, BlendMode.srcIn),
                                    height: 20,
                                  )
                                ],
                              ),
                            ),
                          ), 
                          separatorBuilder: (context, index) => const Divider(
                            color: primaryColor,
                            thickness: 1,
                          ), 
                          itemCount: profileTextItem.length
                        )
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Preferensi',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      const SizedBox(height: 5),
                      GestureDetector(
                        onTap: logOut,
                        child: CustomContainer(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20), 
                          child: Row(
                            children: [
                              Row(
                                children: const [
                                  Icon(Icons.logout_rounded, color: primaryColor),
                                  SizedBox(width: 10),
                                  Text(
                                    'Keluar',
                                    style: TextStyle(
                                      fontSize: 18
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }return const Center(
            child: CircularProgressIndicator(
              color: primaryColor,
            ),
          );
        }
      )
    );
  }
}
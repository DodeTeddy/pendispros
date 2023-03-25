import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quickalert/quickalert.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    List<String> profileTextItem = ['FAQ', 'About'];
    List<Widget> profileiconItem = [
      const Icon(Icons.question_answer_outlined, color: primaryColor),
      const Icon(Icons.book_outlined, color: primaryColor)
    ];

    void logOut(){
      QuickAlert.show(
        context: context,
        type: QuickAlertType.confirm,
        text: 'Do you want to logout',
        confirmBtnText: 'Yes',
        onConfirmBtnTap: ()async{
          final prefs = await SharedPreferences.getInstance();
          prefs.setBool('isLogin', false);
          bool isLogin = prefs.getBool('isLogin') ?? true;
          if (!mounted) return;
          if (!isLogin) {
            Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
          }
        },
        cancelBtnText: 'No',
        confirmBtnColor: primaryColor,
        customAsset: 'assets/images/get_started.png',
        backgroundColor: secondaryColor
      );
    }
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Profile',
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
                          children: const [
                            ProfileHeader(
                              asset: 'assets/images/male.png', 
                              text: 'Dode Teddy'
                            ),
                            SizedBox(height: 10),
                            ProfileItem(
                              icon: Icons.call, 
                              text: '-'
                            ),
                            SizedBox(height: 10),
                            ProfileItem(
                              icon: Icons.pending_actions, 
                              text: 'Not verified',
                              textColor: inActiveColor,
                            )
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          
                        }, 
                        icon: const Icon(
                          Icons.edit,
                          color: primaryColor,
                        )
                      )
                    ],
                  )
                ),
                const SizedBox(height: 20),
                CustomContainer(
                  color: primaryColor,
                  padding: const EdgeInsets.all(20), 
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Verification status details',
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
                          const Expanded(
                            child: Text(
                              'DEWA NGAKAN GEDE TEDDY ADRYAN P',
                              style: TextStyle(
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
                const SizedBox(height: 20),
                const Text(
                  'General Information',
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
                    itemBuilder: (context, index) => Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
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
                          SvgPicture.asset(
                            'assets/icons/arrow_right.svg',
                            colorFilter: const ColorFilter.mode(primaryColor, BlendMode.srcIn),
                            height: 20,
                          )
                        ],
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
                  'Preference',
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
                              'Logout',
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
      )
    );
  }
}
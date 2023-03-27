import 'package:flutter/material.dart';
import 'package:tugas_akhir_app/services/service.dart';
import 'package:tugas_akhir_app/ui/shared/theme/constant.dart';

import '../../../shared/widgets/custom_container.dart';
import '../../onboarding_page/widgets/dot.dart';
import '../widgets/fitur.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  String headerTextVerified = '';
  String textVerified = '';
  Color? textVerifiedColor;
  late PageController _pageController;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: profile(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var profileData = snapshot.data;
            if (profileData!.verifiedAs == 'notverfied') {
              headerTextVerified = 'Haven\'t verified yet?';
              textVerified = 'Not verified';
              textVerifiedColor = inActiveColor;
            }else{
              if (profileData.verifiedAs == 'disability') {
                headerTextVerified = 'Verified as';
                textVerified = 'Disability';
                textVerifiedColor = Colors.green;
              }else if (profileData.verifiedAs == 'prosthetic') {
                headerTextVerified = 'Verified as';
                textVerified = 'Prosthetic';
                textVerifiedColor = Colors.green;
              }
            }
            return Stack(
              children: [
                Container(
                  height: 180,
                  decoration: const BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)
                    )
                  ),
                ),
                SafeArea(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white
                                ),
                                children: [
                                  const TextSpan(
                                    text: 'Halo, '
                                  ),
                                  TextSpan(
                                    text: profileData.username,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600
                                    )
                                  )
                                ]
                              )
                            ),
                            const SizedBox(height: 20),
                            CustomContainer(
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        headerTextVerified,
                                        style: const TextStyle(
                                          fontSize: 15
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      Text(
                                        textVerified,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: textVerifiedColor,
                                          fontWeight: FontWeight.w600
                                        ),
                                      )
                                    ],
                                  ),
                                  Image.asset(
                                    'assets/images/heading.png',
                                    scale: 13,
                                  )
                                ],
                              )
                            ),
                            const SizedBox(height: 30),
                            const Text(
                              'Fitur',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Visibility(
                              visible: true,
                              child: FiturForAdmin()
                            ),
                            const Visibility(
                              visible: false,
                              child: FiturForDisability()
                            ),
                            const Visibility(
                              visible: false,
                              child: FiturForProstheticWs()
                            ),
                            const SizedBox(height: 50),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 160,
                        child: Column(
                          children: [
                            Expanded(
                              child: PageView.builder(
                                controller: _pageController,
                                onPageChanged: (value) {
                                  setState(() {
                                    currentPage = value;
                                  });
                                },
                                itemCount: 3,
                                itemBuilder: (context, index) {
                                  return Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.symmetric(horizontal: 12),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate( 3, (index) => Dot(
                                  index: index,
                                  currentPage: currentPage,
                                )
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(
              color: primaryColor,
            ),
          );
        }
      ),
    );
  }
}
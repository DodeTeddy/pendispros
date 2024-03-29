import 'package:flutter/material.dart';
import 'package:tugas_akhir_app/services/service.dart';
import 'package:tugas_akhir_app/ui/pages/main_page/home_page/detail_data_page.dart';
import 'package:tugas_akhir_app/ui/pages/main_page/home_page/home_page_skeleton.dart';
import 'package:tugas_akhir_app/ui/pages/main_page/home_page/widgets/data_latest_widget.dart';
import 'package:tugas_akhir_app/ui/shared/theme/constant.dart';
import '../../../shared/widgets/custom_container.dart';
import '../../onboarding_page/widgets/dot.dart';
import 'fitur_page/fitur.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  String? headerTextVerified;
  String? textVerified;
  bool isAdmin = false;
  bool isDisability = false;
  bool isWorkshop = false;
  bool isNotVerified = false;
  bool diisabilityNotVer = false;
  bool workshopNotVer = false;
  late PageController _pageController;
  List asset = [
    'assets/images/disability.png',
    'assets/images/prosthetic.png',
    'assets/images/information_service.png'
  ];

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
              if (profileData!.verifiedAs == 'notverified' ||
                  profileData.verifiedAs == 'waiting') {
                if (profileData.role == 'disability') {
                  headerTextVerified = 'Belum Terverifikasi';
                  textVerified = 'Penyandang Disabilitas';
                  isNotVerified = true;
                  diisabilityNotVer = true;
                } else if (profileData.role == 'prosthetic') {
                  headerTextVerified = 'Belum Terverifikasi';
                  textVerified = 'Bengkel Prostetik';
                  isNotVerified = true;
                  workshopNotVer = true;
                }
              } else {
                if (profileData.verifiedAs == 'disability') {
                  headerTextVerified = 'Terverifikasi';
                  textVerified = 'Penyandang Disabilitas';
                  isDisability = true;
                } else if (profileData.verifiedAs == 'prosthetic') {
                  headerTextVerified = 'Terverifikasi';
                  textVerified = 'Bengkel Prostetik';
                  isWorkshop = true;
                } else if (profileData.verifiedAs == 'admin') {
                  headerTextVerified = 'Pendispros';
                  textVerified = 'Beranda Admin';
                  isAdmin = true;
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
                            bottomRight: Radius.circular(20))),
                  ),
                  SafeArea(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, top: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                  text: TextSpan(
                                      style: const TextStyle(
                                          fontSize: 20, color: Colors.white),
                                      children: [
                                    const TextSpan(text: 'Halo, '),
                                    TextSpan(
                                        text: profileData.username.capitalize(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600))
                                  ])),
                              const SizedBox(height: 20),
                              CustomContainer(
                                  padding: const EdgeInsets.all(20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            headerTextVerified ?? '-',
                                            style:
                                                const TextStyle(fontSize: 15),
                                          ),
                                          const SizedBox(height: 20),
                                          Text(
                                            textVerified ?? '-',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: isNotVerified
                                                    ? inActiveColor
                                                    : primaryColor,
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      ),
                                      Image.asset(
                                        'assets/images/heading.png',
                                        scale: 13,
                                      )
                                    ],
                                  )),
                              const SizedBox(height: 30),
                              const Text(
                                'Fitur',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 20),
                              Visibility(
                                visible: isAdmin || isNotVerified,
                                child: FiturForAdminOrNotVer(
                                  isAdmin: isAdmin,
                                  isDisabilty: diisabilityNotVer,
                                  isProsthetic: workshopNotVer,
                                  isNotVerified: isNotVerified,
                                  isWaiting:
                                      profileData.verifiedAs == 'waiting',
                                ),
                              ),
                              Visibility(
                                  visible: isDisability,
                                  child: const FiturForDisability()),
                              Visibility(
                                  visible: isWorkshop,
                                  child: const FiturForProstheticWs()),
                              const SizedBox(height: 50),
                            ],
                          ),
                        ),
                        isAdmin
                            ? FutureBuilder(
                                future: getLatestData(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    var latestData = snapshot.data;
                                    return DataLatestWidget(
                                        prostetikOnTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const DetailDataPage(
                                                      isDisability: false),
                                            ),
                                          );
                                        },
                                        disabilitasOnTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const DetailDataPage(
                                                        isDisability: true),
                                              ));
                                        },
                                        disabilitasData: latestData!
                                            .disability.length
                                            .toString(),
                                        prostetikData: latestData
                                            .prosthetic.length
                                            .toString());
                                  }
                                  return DataLatestWidget(
                                      disabilitasOnTap: () => null,
                                      prostetikOnTap: () => null,
                                      disabilitasData: '0',
                                      prostetikData: '0');
                                },
                              )
                            : SizedBox(
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
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 12),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Image.asset(asset[index])
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: List.generate(
                                          3,
                                          (index) => Dot(
                                                index: index,
                                                currentPage: currentPage,
                                              )),
                                    ),
                                  ],
                                ),
                              ),
                      ],
                    ),
                  ),
                ],
              );
            }
            return const HomePageSkeleton();
          }),
    );
  }
}

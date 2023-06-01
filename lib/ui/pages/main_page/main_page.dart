import 'package:flutter/material.dart';
import 'home_page/home_page.dart';
import 'notifiaction_page/notification_page.dart';
import 'profile_page/profile_page.dart';
import 'widgets/custom_bottom_navigation_bar.dart';
import 'widgets/custom_bottom_navigation_bar_item.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;
  Widget pages(int index) {
    if (index == 0) {
      return const HomePage();
    } else if (index == 1) {
      return const NotificationPage();
    } else {
      return const ProfilePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages(index),
      bottomNavigationBar: CustomBottomNavigationBar(children: [
        CustomBottomNavigationBarItem(
            onTap: () {
              setState(() {
                index = 0;
              });
            },
            asset: 'home.svg',
            title: 'Beranda',
            isActive: index == 0),
        CustomBottomNavigationBarItem(
            onTap: () {
              setState(() {
                index = 1;
              });
            },
            asset: 'notification.svg',
            title: 'Notifikasi',
            isActive: index == 1),
        CustomBottomNavigationBarItem(
            onTap: () {
              setState(() {
                index = 2;
              });
            },
            asset: 'profile.svg',
            title: 'Profil',
            isActive: index == 2),
      ]),
    );
  }
}

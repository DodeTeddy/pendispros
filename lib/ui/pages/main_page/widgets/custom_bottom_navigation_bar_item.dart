import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../shared/theme/constant.dart';

class CustomBottomNavigationBarItem extends StatelessWidget {
  final Function() onTap;
  final String asset;
  final bool isActive;
  final String title;
  const CustomBottomNavigationBarItem(
      {super.key,
      required this.onTap,
      required this.asset,
      required this.title,
      required this.isActive});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: SizedBox(
          width: 60,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/icons/$asset',
                  height: 30,
                  colorFilter: ColorFilter.mode(
                      isActive ? primaryColor : inActiveColor,
                      BlendMode.srcIn)),
              Text(
                title,
                style:
                    TextStyle(color: isActive ? primaryColor : inActiveColor),
              )
            ],
          ),
        ));
  }
}

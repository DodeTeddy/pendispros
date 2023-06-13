import 'package:flutter/material.dart';

import '../theme/constant.dart';

class CustomDrawer extends StatelessWidget {
  final Function() onTap;
  final String text;
  final bool isPick;
  const CustomDrawer({super.key, required this.onTap, required this.text, required this.isPick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 30,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: isPick ? primaryColor : secondaryColor
          )
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 20
            ),
          ),
        ),
      ),
    );
  }
}
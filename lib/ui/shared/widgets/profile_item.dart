import 'package:flutter/material.dart';

import '../theme/constant.dart';

class ProfileItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color textColor;
  const ProfileItem(
      {super.key,
      required this.icon,
      required this.text,
      this.textColor = primaryColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: primaryColor,
          size: 20,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: TextStyle(fontSize: 15, color: textColor),
          ),
        )
      ],
    );
  }
}

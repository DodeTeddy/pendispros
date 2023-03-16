import 'package:flutter/material.dart';

import '../../../shared/theme/constant.dart';

class ProfileHeader extends StatelessWidget {
  final String asset;
  final String text;
  const ProfileHeader({super.key, required this.asset, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 55,
          width: 55,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(asset),
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 3,
                color: inActiveColor
              )
            ]
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 18
            ),
          ),
        )
      ],
    );
  }
}
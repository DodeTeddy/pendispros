import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/constant.dart';

class CustomTextFormField extends StatelessWidget {
  final String title;
  final bool obscureText;
  final bool isHide;
  final Function() onTap;
  const CustomTextFormField({
    super.key, 
    required this.title, 
    this.obscureText = false, 
    this.isHide = true,
    required this.onTap, 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 15
            ),
          ),
          const SizedBox(height: 5),
          obscureText
          ? TextFormField(
            cursorColor: primaryColor,
            style: TextStyle(
              color: primaryColor
            ),
            obscureText: isHide,
            decoration: InputDecoration(
              suffixIcon: Container(
                padding: const EdgeInsets.all(15),
                child: GestureDetector(
                  onTap: onTap,
                  child: SvgPicture.asset(
                    isHide ? 'assets/icons/eye_close.svg' : 'assets/icons/eye_open.svg',
                    colorFilter: ColorFilter.mode(isHide ? inActiveColor : primaryColor, BlendMode.srcIn),
                  ),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: secondaryColor,
                  width: 2
                )
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: primaryColor,
                  width: 2
                )
              )
            ),
          )
          : TextFormField(
            cursorColor: primaryColor,
            style: TextStyle(
              color: primaryColor
            ),
            obscureText: obscureText,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: secondaryColor,
                  width: 2
                )
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: primaryColor,
                  width: 2
                )
              )
            ),
          )
        ],
      ),
    );
  }
}
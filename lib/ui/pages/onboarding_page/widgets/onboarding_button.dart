import 'package:flutter/material.dart';
import '../../../shared/theme/constant.dart';

class OnboardingButton extends StatelessWidget {
  final Function() onTap;
  final String title;
  const OnboardingButton({super.key, required this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 60),
          height: 50,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                color: inActiveColor,
                spreadRadius: 3
              )
            ]
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(width: 15),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18
                  ),
                ),
                const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 18,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
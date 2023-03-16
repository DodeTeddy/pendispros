import 'package:flutter/material.dart';

class AuthTextButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  final String textButton;
  const AuthTextButton({super.key, required this.onTap, required this.text, required this.textButton});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.grey
          ),
        ),
        const SizedBox(width: 5),
        GestureDetector(
          onTap: onTap,
          child: Text(
            textButton,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600
            ),
          ),
        ),
      ],
    );
  }
}
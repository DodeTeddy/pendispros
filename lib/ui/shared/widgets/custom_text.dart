import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String lable;
  final String value;
  const CustomText({super.key, required this.lable, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 8,
          child: Text(
            lable,
            style: const TextStyle(
              fontSize: 15,
            )
          ),
        ),
        const Expanded(
          flex: 2,
          child: Text(
            ':',
            style: TextStyle(
              fontSize: 15,
            )
          ),
        ),
        Expanded(
          flex: 16,
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 15,
            )
          ),
        ),
      ],
    );
  }
}
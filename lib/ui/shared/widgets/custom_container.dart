import 'package:flutter/material.dart';

import '../theme/constant.dart';

class CustomContainer extends StatelessWidget {
  final EdgeInsets margin;
  final EdgeInsets padding;
  final Widget child;
  final Color color;
  const CustomContainer({super.key, this.margin = const EdgeInsets.all(0), required this.padding, required this.child, this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 1,
          color: inActiveColor
        ),
        boxShadow: const [
          BoxShadow(
            blurRadius: 3,
            color: inActiveColor
          )
        ]
      ),
      child: child,
    );
  }
}
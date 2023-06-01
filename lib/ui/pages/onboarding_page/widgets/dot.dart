import 'package:flutter/material.dart';
import '../../../shared/theme/constant.dart';

class Dot extends StatelessWidget {
  final int index;
  final int currentPage;
  const Dot({super.key, required this.index, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: index == currentPage ? 10 : 6,
      decoration: BoxDecoration(
          color: index == currentPage ? primaryColor : Colors.grey,
          borderRadius: BorderRadius.circular(50)),
    );
  }
}

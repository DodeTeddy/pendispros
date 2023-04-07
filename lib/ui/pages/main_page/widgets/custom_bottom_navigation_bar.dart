import 'package:flutter/material.dart';
import 'package:tugas_akhir_app/ui/shared/theme/constant.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final List<Widget> children;
  const CustomBottomNavigationBar({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20)
        ),
        border: Border.all(
          width: 1, 
          color: inActiveColor
        ),
        boxShadow: const [
          BoxShadow(
            color: inActiveColor,
            blurRadius: 5
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: children
      )
    );
  }
}
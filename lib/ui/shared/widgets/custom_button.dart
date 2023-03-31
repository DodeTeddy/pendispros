import 'package:flutter/material.dart';
import 'package:tugas_akhir_app/ui/shared/theme/constant.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onTap, this.isLoading = false, this.title = 'Continue'});
  
  final bool isLoading;
  final Function() onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(50),
          boxShadow: const [
            BoxShadow(
              blurRadius: 4,
              color: inActiveColor,
              spreadRadius: 3
            )
          ]
        ),
        child: Center(
          child: isLoading 
          ? const CircularProgressIndicator(
            color: Colors.white,
          )
          : Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

import '../theme/constant.dart';

class CustomSearch extends StatelessWidget {
  final Function(String) onFieldSubmitted;
  const CustomSearch({super.key, required this.onFieldSubmitted});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5, left: 12, right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 1, color: Colors.grey),
        color: Colors.white,
      ),
      child: Center(
        child: TextFormField(
          textInputAction: TextInputAction.search,
          onFieldSubmitted: onFieldSubmitted,
          cursorColor: Colors.grey,
          style: const TextStyle(color: primaryColor),
          decoration: const InputDecoration(
            hintText: 'Pencarian',
            suffixIcon: Icon(Icons.search),
            suffixIconColor: Colors.grey,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}

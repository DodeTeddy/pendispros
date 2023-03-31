import 'package:flutter/material.dart';

import '../theme/constant.dart';

class CustomDropDown extends StatelessWidget {
  final String title;
  final Object value;
  final void Function(dynamic)? onChanged;
  final List<DropdownMenuItem<Object?>> items;
  const CustomDropDown({super.key, required this.title, required this.value, this.onChanged, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 15
          ),
        ),
        const SizedBox(height: 5),
        DropdownButtonFormField(
          isExpanded: true,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                width: 2,
                color: secondaryColor
              )
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                width: 2,
                color: secondaryColor
              )
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                width: 2,
                color: primaryColor
              )
            ),
          ),
          iconEnabledColor: primaryColor,
          borderRadius: BorderRadius.circular(15),
          value: value,
          onChanged: onChanged,
          items: items
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';

const Color primaryColor = Color(0XFF252E4E);
const Color secondaryColor = Color(0XFFECF2FF);
const Color inActiveColor = Color(0XFFC3C8D8);

const String appName = 'Pendispros';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

import 'package:flutter/material.dart';
// import 'package:covid_plasma_fyp/constants/colors.dart';
import 'package:flutter_application_covid/utils/constants.dart';

BoxDecoration newboxDecoration() {
  return BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: klightShadowForLight,
        offset: Offset(-4.0, -4.0),
        blurRadius: 7.0,
      ),
      BoxShadow(
        color: kdarkShadowForLight,
        offset: Offset(4.0, 4.0),
        blurRadius: 7.0,
      ),
    ],
    color: Color(0xFFEFEEEE),
    borderRadius: BorderRadius.circular(20.0),
  );
}

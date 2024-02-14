import 'package:flutter/material.dart';

import '../utils/colors.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final double textSize;
  final FontWeight? fontWeight;
  final Color? color;

  const CustomTextWidget(
      {Key? key,
      required this.text,
      required this.textSize,
      this.fontWeight,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontWeight: fontWeight ?? FontWeight.normal,
          fontSize: textSize,
          color: color ?? AppColors.textDark),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:promilo_development_task/src/utils/colors.dart';

class ButtonPrimary extends StatelessWidget {
  final String text;
  final Function? function; // add this

  const ButtonPrimary({Key? key, required this.text, required this.function})
      : super(key: key);

  @override //check
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        if (function != null) {
          function!();
        }
      },
      color: AppColors.primaryColor,
      minWidth: double.infinity,
      height: 40,
      padding: const EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 8.0,
      child: Text(
        text,
        style: const TextStyle(color: AppColors.whiteColor),
      ),
    );
  }
}

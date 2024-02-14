import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:promilo_development_task/src/utils/colors.dart';
import 'package:promilo_development_task/src/view/login_screen/login_controller.dart';

class BuildLoginButtonWidget extends StatelessWidget {
  BuildLoginButtonWidget({super.key});
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 35),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: loginController.isEnable
                ? const Color.fromARGB(255, 16, 158, 224)
                : const Color.fromARGB(255, 198, 209, 214),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(
                  color: Color.fromARGB(255, 16, 158, 224), width: 2),
            ),
            padding: const EdgeInsets.all(15)),
        onPressed: (() {
          loginController.isEnable
              ? (loginController.prepareLoginData())
              : null;
        }),
        child: const Text(
          'Submit',
          style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

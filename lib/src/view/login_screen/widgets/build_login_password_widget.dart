import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:promilo_development_task/src/view/login_screen/login_controller.dart';

import '../../../utils/colors.dart';
import 'build_login_username_view.dart';

class BuildloginPasswordWidget extends StatelessWidget
    with InputValidationMixin {
  BuildloginPasswordWidget({super.key});
  final LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Password',
          style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 15,
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          // height: 54,
          child: TextFormField(
            controller: loginController.passwordController,
            obscureText: false,
            onChanged: (val) {
              isPasswordValid(val);
              loginController.validateButton();
            },
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 167, 0, 0), width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 167, 0, 0), width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: AppColors.primaryColor, width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: AppColors.primaryColor, width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: AppColors.primaryColor, width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                // prefixIcon: const Icon(
                //   Icons.lock,
                //   color: AppColors.primaryColor,
                // ),

                hintText: 'Enter Password',
                hintStyle:
                    const TextStyle(color: Color.fromARGB(255, 121, 171, 195))),
            validator: (password) {
              if (isPasswordValid(password!)) {
                return null;
              } else {
                return 'Enter a valid password';
              }
            },
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:promilo_development_task/src/view/login_screen/login_controller.dart';
import '../../../utils/colors.dart';

class BuildLoginEmailView extends StatelessWidget with InputValidationMixin {
  BuildLoginEmailView({super.key});
  final LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Please Sign in to continue',
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
            controller: loginController.userNameController,
            onChanged: (val) {
              isUserNameValid(val);
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
                hintText: 'Enter Email or Mob No.',
                hintStyle:
                    const TextStyle(color: Color.fromARGB(255, 121, 171, 195))),
            validator: (text) {
              if (isUserNameValid(text!)) {
                return null;
              } else {
                return 'Enter a valid Email or Mob no';
              }
            },
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(right: 8.0, top: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                // width: 200,
                height: 20,
                child: Center(
                    child: Text(
                  'Sign In With OTP',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color.fromARGB(255, 0, 143, 209)),
                )),
              ),
            ],
          ),
        )
      ],
    );
  }
}

mixin InputValidationMixin {
  bool isUserNameValid(String text) => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(text);

  bool isPasswordValid(String text) =>
      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]")
          .hasMatch(text);
}

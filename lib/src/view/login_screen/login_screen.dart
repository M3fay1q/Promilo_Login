import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:promilo_development_task/src/utils/colors.dart';
import 'package:promilo_development_task/src/view/login_screen/login_controller.dart';
import 'package:promilo_development_task/src/view/login_screen/widgets/build_login_button_widget.dart';
import 'package:promilo_development_task/src/view/login_screen/widgets/build_login_password_widget.dart';
import 'package:promilo_development_task/src/view/login_screen/widgets/build_login_social_media_deign.dart';
import 'package:promilo_development_task/src/view/login_screen/widgets/build_login_username_view.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.whiteColor,
        ),
        child: GetBuilder(
            init: loginController,
            builder: (loginController) {
              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 40,
                ),
                child: Form(
                  key: loginController.formkey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 200,
                        height: 40,
                        child: Center(
                            child: Text(
                          'promilo',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        )),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const SizedBox(
                        width: 200,
                        height: 40,
                        child: Center(
                            child: Text(
                          'Hi, Welcome Back!',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color.fromARGB(255, 0, 81, 118)),
                        )),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      BuildLoginEmailView(),
                      const SizedBox(
                        height: 16,
                      ),
                      BuildloginPasswordWidget(),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                  height: 24.0,
                                  width: 24.0,
                                  child: Theme(
                                    data: ThemeData(
                                        unselectedWidgetColor: const Color(
                                            0xff00C8E8) // Your color
                                        ),
                                    child: Checkbox(
                                      side: const BorderSide(
                                          color: Color.fromARGB(
                                              255, 168, 168, 168),
                                          width: 1.54),
                                      activeColor: const Color(0xff00C8E8),
                                      value: loginController.checkedValue,
                                      onChanged: (newValue) {
                                        loginController
                                            .onRememberMeChecked(newValue!);
                                      },
                                    ),
                                  )),
                              const SizedBox(width: 5.0),
                              const Text("Remember Me",
                                  style: TextStyle(
                                      color: Color(0xff646464),
                                      fontSize: 14,
                                      fontFamily: 'Rubic'))
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: SizedBox(
                              // width: 200,
                              height: 20,
                              child: Center(
                                  child: Text(
                                'Forget Password',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 0, 143, 209)),
                              )),
                            ),
                          ),
                        ],
                      ),
                      // SizedBox(
                      //   height: 20,
                      //   child: CheckboxListTile(
                      //     contentPadding: EdgeInsetsDirectional.all(0),

                      //     title: const Text("Remember me"),
                      // value: loginController.checkedValue,
                      // onChanged: (newValue) {
                      //   loginController.onRememberMeChecked(newValue!);
                      // },
                      //     controlAffinity: ListTileControlAffinity
                      //         .leading, //  <-- leading Checkbox
                      //   ),
                      // ),
                      BuildLoginButtonWidget(),
                      BuildLoginSocialMediaDesignWidget(),
                    ],
                  ),
                ),
              );
            }),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        height: 100,
        child: const Padding(
          padding: EdgeInsets.only(bottom: 4.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 40),
                child: SizedBox(
                  height: 20,
                  child: Text(
                    'By continuing, you agree to',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 154, 154, 154),
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Promilo\'s',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 142, 142, 142),
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    'Terms of Use & Privacy Policy.',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

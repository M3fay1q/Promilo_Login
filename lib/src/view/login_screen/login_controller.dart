import 'dart:convert';
import 'dart:developer';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:promilo_development_task/src/data/api/dio_client.dart';
import 'package:promilo_development_task/src/data/api/dio_result.dart';
import 'package:promilo_development_task/src/helpers/app_routes.dart';
import 'package:promilo_development_task/src/utils/colors.dart';
import 'package:promilo_development_task/src/view/login_screen/login_response_model.dart';

class LoginController extends GetxController {
  final formkey = GlobalKey<FormState>();
  late TextEditingController userNameController, passwordController;
  final DioClient dioClient = DioClient();
  String hashedPassword = '';
  // final secureStorage = const FlutterSecureStorage();
  bool checkedValue = false;

  bool isEnable = false;

  @override
  void onInit() {
    super.onInit();
    userNameController = TextEditingController();
    passwordController = TextEditingController();

    checkRememberMeData();
  }

  Future<void> checkRememberMeData() async {
    // var isRememberMe = await secureStorage.read(key: "isRememberMe");

    // if (isRememberMe != null) {
    //   if (isRememberMe == "true") {
    //     checkedValue = true;
    //     userNameController.text = (await secureStorage.read(key: "userName"))!;
    //     passwordController.text = (await secureStorage.read(key: "password"))!;
    //   }
    //   update();
    // }
  }

  prepareLoginData() {
    if (formkey.currentState!.validate()) {
      String userName = userNameController.text;
      String password = passwordController.text;
      hashedPassword = sha256.convert(utf8.encode(password)).toString();
      log(hashedPassword.toString());
      if (userName.isNotEmpty && password.isNotEmpty) {
        doLogin(userName, hashedPassword);
        log('dologin called');
      }
    } else {
      Get.showSnackbar(
        const GetSnackBar(
          message: 'Enter the Detail Properly!!',
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  doLogin(String userName, String password) async {
    var postMap = {
      'username': userName,
      'password': hashedPassword,
      'grant_type': 'password',
    };
    showLoading();
    DioResult result = await dioClient.post('', postMap);

    if (result is SuccessState) {
      var jsonData = LoginResponseModel.fromJson(result.value);
      if (jsonData.status?.code == 200) {
        hideLoading();
        saveLoginData(jsonData);
      } else {
        hideLoading();

        Get.showSnackbar(
          GetSnackBar(
            message: jsonData.status?.message,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    } else if (result is ErrorState) {
      hideLoading();
      Get.showSnackbar(
        const GetSnackBar(
          message: 'Invalid Login Id or Password.',
          duration: Duration(seconds: 3),
        ),
      );
      debugPrint("Error occurred!");
    }
  }

  // Save the data in local db
  void saveLoginData(jsonData) {
    Get.toNamed(AppRoutes.home);
  }

  showLoading() {
    Get.dialog(
      const Dialog(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(
                color: AppColors.primaryColor,
                // size: 50.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  hideLoading() {
    if (Get.isDialogOpen!) Get.back();
  }

  void onRememberMeChecked(bool newValue) {
    checkedValue = newValue;
    update();
  }

  void validateButton() {
    bool isValid = true;

    isValid = userNameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(userNameController.text) &&
        RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]")
            .hasMatch(passwordController.text);

    isEnable = isValid;
    update();
  }

  @override
  void onClose() {
    super.onClose();
    userNameController.dispose();
    passwordController.dispose();
  }
}

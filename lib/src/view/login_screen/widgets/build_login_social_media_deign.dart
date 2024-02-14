import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:promilo_development_task/src/utils/colors.dart';
import 'package:promilo_development_task/src/view/login_screen/login_controller.dart';

class BuildLoginSocialMediaDesignWidget extends StatelessWidget {
  BuildLoginSocialMediaDesignWidget({super.key});
  final LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2),
      width: double.infinity,
      child: const Column(
        children: [
          Row(
            children: <Widget>[
              Expanded(
                  child: Divider(
                color: Color.fromARGB(255, 229, 229, 229),
              )),
              Text("or"),
              Expanded(
                  child: Divider(
                color: Color.fromARGB(255, 229, 229, 229),
              )),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                FontAwesomeIcons.google,
                color: Colors.red,
                size: 40,
              ),
              SizedBox(
                width: 8,
              ),
              Icon(
                FontAwesomeIcons.linkedin,
                color: Colors.blue,
                size: 40,
              ),
              SizedBox(
                width: 8,
              ),
              Icon(
                FontAwesomeIcons.facebook,
                color: Color.fromARGB(255, 31, 110, 174),
                size: 40,
              ),
              SizedBox(
                width: 8,
              ),
              Icon(
                FontAwesomeIcons.instagram,
                color: Color.fromARGB(255, 237, 91, 6),
                size: 40,
              ),
              SizedBox(
                width: 8,
              ),
              Icon(
                FontAwesomeIcons.whatsapp,
                color: Colors.green,
                size: 40,
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Business User?',
                    style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 106, 106, 106),
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    'Login Here',
                    style: TextStyle(
                        fontSize: 16,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Don\'t have an account?',
                    style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 106, 106, 106),
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    'Sign Up ',
                    style: TextStyle(
                        fontSize: 16,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

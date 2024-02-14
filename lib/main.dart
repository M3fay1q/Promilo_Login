import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:promilo_development_task/src/utils/constants.dart';

import 'src/helpers/app_routes.dart';
import 'src/helpers/route_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppRoutes.login,
      getPages: RouteHelper.getAllPages(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'lib/config/dependancy_injection.dart';
import 'lib/core/routes.dart';

void main() async {
  await initModule();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splashScreen,
      onGenerateRoute: RouteGenerator.getRoute,
    );
  }
}
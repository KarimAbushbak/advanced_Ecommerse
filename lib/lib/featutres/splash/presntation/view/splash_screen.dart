import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/resources/manager_assets.dart';
import '../controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (context) {
        return Scaffold(

          body: Container(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        alignment: Alignment.centerLeft,
                          image: AssetImage(ManagerAssets.splash1))),
                ),
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                    ManagerAssets.splash2,
                  ))),
                )
              ],
            ),
          ),
        );
      }
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:advanced_ecommerse/lib/core/extensions/extensions.dart';
import '../../../../core/resources/manager_colors.dart';
import '../../../../core/routes.dart';
import '../../../../core/storage/local/database/shared_preferences/app_settings_shared_preferences.dart';
import '../../../../core/widgets/helpers.dart';
import '../../data/data_source/auth_api_controller.dart';

class AuthController extends GetxController with Helpers {
  late TextEditingController emailTextEditingController;
  late TextEditingController passwordTextEditingController;
  late TextEditingController confirmPasswordTextEditingController;
  late TextEditingController userNameTextEditingController;
  late TextEditingController phoneTextEditingController;
  AppSettingsSharedPreferences appSettingsSharedPreferences =
      AppSettingsSharedPreferences();
  AuthApiController authApiController = AuthApiController();
  String? emailError;
  String? passwordError;
  String? confirmPasswordError;
  String? nameError;
  String? phoneError;
  bool showPassword = true;
  bool showConfirmPassword = true;
  bool isEmailTab = true;
  bool checkboxValue = false;

  changeValue() {
    checkboxValue = !checkboxValue;
    update();
  }

  changePasswordVisibility() {
    showPassword = !showPassword;
    update();
  }

  changeConfirmPasswordVisibility() {
    showConfirmPassword = !showConfirmPassword;
    update();
  }

  @override
  @override
  @override
  void onInit() {
    emailTextEditingController = TextEditingController();
    passwordTextEditingController = TextEditingController();
    confirmPasswordTextEditingController = TextEditingController();
    userNameTextEditingController = TextEditingController();
    phoneTextEditingController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailTextEditingController.dispose();
    passwordTextEditingController.dispose();
    confirmPasswordTextEditingController.dispose();
    phoneTextEditingController.dispose();
    userNameTextEditingController.dispose();
    super.dispose();
  }

  resetErrors() {
    emailError = null;
    passwordError = null;
    confirmPasswordError = null;
    nameError = null;
    phoneError = null;
  }

  Future<void> preformLogin(BuildContext context) async {
    resetErrors();
    if (checkData(context)) {
      showDialog(
        context: context,
        barrierDismissible: false, // Prevent user from dismissing manually
        builder: (context) {
          return Center(
            child: Container(
              width: 200,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Logging in...",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 15),
                  TweenAnimationBuilder(
                    duration: Duration(seconds: 3),
                    tween: Tween<double>(begin: 0, end: 1),
                    builder: (context, double value, child) {
                      return LinearProgressIndicator(
                        value: value, // Animated progress
                        backgroundColor: Colors.grey[300],
                        color: ManagerColors.primaryColor,
                        minHeight: 6,
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      );

      // Simulate network request delay
      await Future.delayed(Duration(seconds: 3));

      // Perform login API call
      bool success = await authApiController.login(
        email: emailTextEditingController.text.toString(),
        password: passwordTextEditingController.text.toString(),
        context: context,
      );

      // Close loading dialog
      Get.back();

      // Show success or error message
      if (success) {
        showSnackBar(context: context, message: "Login Successfully");
        Get.offAllNamed(Routes.homeView);
      }
    }
    update();
  }


  Future<void> performRegister(BuildContext context) async {
    resetErrors();
    if (checkRegisterData(context)) {
      // Show animated loading dialog
      showDialog(
        context: context,
        barrierDismissible: false, // Prevent user from dismissing manually
        builder: (context) {
          return Center(
            child: Container(
              width: 200,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Creating Account...",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 15),
                  TweenAnimationBuilder(
                    duration: Duration(seconds: 3),
                    tween: Tween<double>(begin: 0, end: 1),
                    builder: (context, double value, child) {
                      return LinearProgressIndicator(
                        value: value, // Animated progress
                        backgroundColor: Colors.grey[300],
                        color: ManagerColors.primaryColor,
                        minHeight: 6,
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      );

      // Simulate network request delay
      await Future.delayed(Duration(seconds: 3));

      // Perform registration API call
      bool success = await authApiController.register(
        context: context,
        email: emailTextEditingController.text.toString(),
        password: passwordTextEditingController.text.toString(),
        name: userNameTextEditingController.text.toString(),
        confirmPassword: confirmPasswordTextEditingController.text.toString(),
        phone: phoneTextEditingController.text.toString(),
      );

      // Close loading dialog
      Get.back();

      // Show success or error message
      if (success) {
        showSnackBar(context: context, message: 'Register Successfully');
        Get.offAllNamed(Routes.loginView);
      }
    }
    update();
  }


  bool checkName(BuildContext context) {
    if (userNameTextEditingController.text.isEmpty) {
      nameError = 'Username is required';
      showSnackBar(
        context: context,
        message: nameError.onNull(),
        error: true,
      );
      return false;
    }
    return true;
  }

  bool checkPhone(BuildContext context) {
    if (phoneTextEditingController.text.isEmpty) {
      phoneError = 'Phone is required';
      showSnackBar(
        context: context,
        message: phoneError.onNull(),
        error: true,
      );
      return false;
    }
    return true;
  }

  bool checkEmail(BuildContext context) {
    if (emailTextEditingController.text.isEmpty) {
      emailError = 'Email is required';
      showSnackBar(
        context: context,
        message: emailError.onNull(),
        error: true,
      );
      return false;
    }
    return true;
  }

  bool checkPassword(BuildContext context) {
    if (passwordTextEditingController.text.isEmpty) {
      passwordError = 'Password is required';
      showSnackBar(
        context: context,
        message: passwordError.onNull(),
        error: true,
      );
      return false;
    }
    if (passwordTextEditingController.text.length < 6) {
      showSnackBar(
        context: context,
        message: 'Password must be at least 6 characters',
        error: true,
      );

      return false;
    }

    return true;
  }

  bool checkConfirmPassword(BuildContext context) {
    if (passwordTextEditingController.text !=
        confirmPasswordTextEditingController.text) {
      passwordError = 'Password is not matched';
      confirmPasswordError = passwordError;
      showSnackBar(
        context: context,
        message: passwordError.onNull(),
        error: true,
      );
      return false;
    }

    return true;
  }

  bool checkData(BuildContext context) {
    if (!checkEmail(context)) {
      return false;
    }

    if (!checkPassword(context)) {
      return false;
    }

    return true;
  }

  bool checkRegisterData(BuildContext context) {
    if (!checkName(context)) {
      return false;
    }

    if (!checkEmail(context)) {
      return false;
    }

    if (!checkPhone(context)) {
      return false;
    }

    if (!checkPassword(context)) {
      return false;
    }

    if (!checkConfirmPassword(context)) {
      return false;
    }

    return true;
  }
}

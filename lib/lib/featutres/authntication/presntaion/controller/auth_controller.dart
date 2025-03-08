import 'package:get/get.dart';

class AuthController extends GetxController{
  bool isEmailTab =true;
  bool checkboxValue =false;
   changeValue(){
    checkboxValue=!checkboxValue;
    update();
  }
  changeTap(){
    isEmailTab=!isEmailTab;
    update();
  }

@override
  void onInit() {
  checkboxValue=true;
    super.onInit();
  }

}
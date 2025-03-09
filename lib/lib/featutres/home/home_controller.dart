import 'package:get/get.dart';

class HomeController extends GetxController{
  var isMale = true.obs; // Use observable variable

  void changeMale(int index) {
    isMale.value = index == 0; // Update based on selected tab
  }
}

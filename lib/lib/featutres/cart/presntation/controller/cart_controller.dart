import 'package:get/get.dart';

class CartController extends GetxController {
  var cartItems = <Map<String, dynamic>>[].obs; // List to store cart products

  void addToCart(Map<String, dynamic> product) {
    cartItems.add(product);
  }
}

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class UbahPasswordController extends GetxController {
  //TODO: Implement UbahPasswordController
  final formkey = GlobalKey<FormState>();
  
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}

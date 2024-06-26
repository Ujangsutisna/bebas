import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController
  final loginformKey = GlobalKey<FormState>();
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
    loginformKey.currentState?.dispose();
    loginformKey.currentState?.reset();
    super.onClose();
  }

  void increment() => count.value++;
}

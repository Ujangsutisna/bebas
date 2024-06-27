import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class DaftarkknController extends GetxController {
  //TODO: Implement DaftarkknController
  RxList<TextEditingController> NimAnggotactrl = <TextEditingController>[].obs;
  final List<GlobalKey> formkey = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];
  final count = 0.obs;
  var currentstep = 0.obs;
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
    NimAnggotactrl.forEach((controller) => controller.dispose());
    super.onClose();
  }

  void removeItem(int index) {
    NimAnggotactrl[index].clear(); // Dispose the controller
    NimAnggotactrl[index].dispose(); // Dispose the controller
    NimAnggotactrl.removeAt(index); // Remove the item from the list
    update();
  }

  void addItem() {
    NimAnggotactrl.add(TextEditingController());
    update();
  }


  void increment() => count.value++;
}

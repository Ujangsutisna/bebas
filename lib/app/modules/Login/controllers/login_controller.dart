// ignore_for_file: non_constant_identifier_names

import 'package:bebas/app/data/Helpers/apiclient.dart';
import 'package:bebas/app/data/Helpers/user_info.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController
  final loginformKey = GlobalKey<FormState>();
  var messageEror = ''.obs;
  Rx<String> Dropdownvalue = 'mahasiswa'.obs;
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

  LoginService(nim, password) async {
    try {
      bool isTrue = false;
      dynamic data = {
        'type_account': Dropdownvalue.value,
        'id': nim,
        'password': password
      };
      final response = await ApiClient().post('api/auth/login', data);
      final token = response.data['token'];
      final message = response.data['message'];

      if (token != null) {

        await UserInfo().setTypeAccount(Dropdownvalue.value);
        await UserInfo().setUserID(nim);
        await UserInfo().setToken(token);
        isTrue = true;
      } else {
        messageEror.value = message;
      }
      return isTrue;
    } catch (e) {
      print('Error $e');
    }
  }
}

import 'package:bebas/app/data/Helpers/apiclient.dart';
import 'package:bebas/app/data/Laporanpost.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LaporanController extends GetxController {
  TextEditingController titleCtrl = TextEditingController();
  TextEditingController bodyCtrl = TextEditingController();
  final formkey = GlobalKey<FormState>();
  //TODO: Implement LaporanController

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

  inputLaporan(LaporanPost laporanpost) async {
    try {
      print(laporanpost);
      var data = laporanpost.toJson();
      final response = await ApiClient().post('api/laporan', data);
      print(response.statusCode);
      print(response.data['message']);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.offNamed('beranda');
        Get.snackbar('Berhasil', response.data['message'],
            overlayBlur: 1,
            colorText: Colors.white,
            backgroundColor: Colors.cyan);
      } else {
        Get.snackbar('Gagal', response.data['message'],
            overlayBlur: 1,
            colorText: Colors.white,
            backgroundColor: Colors.red);
      }
    } catch (e) {
      print('Error :: $e');
    }

    void increment() => count.value++;
  }
}

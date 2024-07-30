import 'package:bebas/app/data/Helpers/apiclient.dart';
import 'package:bebas/app/data/model/bimbingan_model.dart';
import 'package:bebas/app/data/model/kelompokget_model.dart';
import 'package:bebas/app/modules/beranda/views/beranda_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class BimbinganDospemController extends GetxController {
  //TODO: Implement BimbinganDospemController
  final formKey = GlobalKey<FormState>();
  TextEditingController titleCtrl = TextEditingController();
  TextEditingController bodyCtrl = TextEditingController();
  TextEditingController linkCtrl = TextEditingController();
  TextEditingController tanggalCtrl = TextEditingController();
  KelompokGet kelompok = Get.arguments;
  var selectedDate = DateTime.now().obs;
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

  void updateDate(DateTime newDate) {
    selectedDate.value = newDate;
  }

  insertBimbingan(BimbinganModel bimbingan) async {
    var data = bimbingan.toJsonPost();
    print('data json $data');
    final response = await ApiClient().post('api/bimbingan', data);
    if (response.statusCode == 200 || response.statusCode == 201) {
      Get.toNamed('bimbingan-dospem', arguments: kelompok);
      Get.snackbar('Berhasil', '${response.data['message']}',
          backgroundColor: Colors.green, colorText: Colors.white);
    } else {
      Get.snackbar('Maaf', '${response.data['message']}',
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  void increment() => count.value++;
}

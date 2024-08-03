import 'dart:io';
import 'package:bebas/app/data/Helpers/apiclient.dart';
import 'package:bebas/app/data/model/kelompokget_model.dart';
import 'package:bebas/app/data/model/laporan_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LaporanController extends GetxController {
  TextEditingController titleCtrl = TextEditingController();
  TextEditingController bodyCtrl = TextEditingController();
  Rx<AllLaporanModel> allLaporan = AllLaporanModel().obs;
  Rx<bool> isdatalaporan = false.obs;

  KelompokGet kelompok = Get.arguments;
  late File selectedFile;
  final RxString fileName = ''.obs;

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
    viewLaporan();
  }

  @override
  void onClose() {
    super.onClose();
  }

  txtCtrlClear() {
    titleCtrl.clear();
    bodyCtrl.clear();
    fileName.value = '';
  }

  viewLaporan() async {
    try {
      final response = await ApiClient().get('api/laporan');
      List<dynamic> laporan = response.data;
      final lengthLaporan = laporan.length;
      List<dynamic> allLaporanByKelompok = [];
      for (int i = 0; i < lengthLaporan; i++) {
        if (laporan[i]['id_kelompok'] == kelompok.idKelompok) {
          allLaporanByKelompok.add(laporan[i]);
        }
      }
      if (allLaporanByKelompok.isNotEmpty) {
        allLaporan.value = AllLaporanModel.fromJson(allLaporanByKelompok);
        isdatalaporan.value = true;
      } else {
        print('ga da');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  inputLaporan(String title, String body, File file) async {
    try {
      String fileName = file.path.split('/').last.replaceAll(' ', '_');

      // Create FormData with a Map
      dynamic data = [title, body, file, fileName];
      final response = await ApiClient().postFile('api/laporan', data);
      if (response.statusCode == 201 || response.statusCode == 200) {
        viewLaporan();
        txtCtrlClear();
        Get.snackbar('Berhasil', response.data['message'],
            colorText: Colors.white, backgroundColor: Colors.green);
      } else {
        Get.snackbar('Gagal', response.data['message'],
            colorText: Colors.white, backgroundColor: Colors.red);
      }
    } catch (e, stacktrace) {
      print('Error :: $e');
      print('Error :: $stacktrace');
    }

    void increment() => count.value++;
  }
}

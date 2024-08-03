// ignore_for_file: non_constant_identifier_names, unnecessary_overrides, avoid_print

import 'package:bebas/app/data/Helpers/apiclient.dart';
import 'package:bebas/app/data/model/kelompokget_model.dart';
import 'package:bebas/app/data/model/laporan_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LaporanDospemController extends GetxController {
  //TODO: Implement LaporanDospemController
  KelompokGet kelompok = Get.arguments;
  Rx<AllLaporanModel> allLaporan = AllLaporanModel().obs;
  Rx<bool> isdatalaporan = false.obs;
  Rx<bool> isDetailData = false.obs;
  Rx<int> indexDetailData = 0.obs;
  Rx<String> Dropdownvalue = 'approve'.obs;
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
      } else {}
    } catch (e) {
      print('Error: $e');
    }
  }

  btnUpdateStatus(int? id, LaporanModel laporan) async {
    try {
      print('id:$id');
      var data = laporan.toJsonStatus();
      print(data);
      final response = await ApiClient().put('api/laporan/$id/status', data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        viewLaporan();
        Get.back();
        Get.snackbar('Berhasil', response.data['message' ],
            backgroundColor: Colors.green, colorText: Colors.white);
      } else {
        Get.back();
        Get.snackbar('Maaf', response.data['message'],
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (e) {
      print('Error : $e');
    }
  }

  void increment() => count.value++;
}

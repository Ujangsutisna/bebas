// ignore_for_file: non_constant_identifier_names, unnecessary_overrides

import 'package:bebas/app/data/Helpers/apiclient.dart';
import 'package:bebas/app/data/kelompokget_model.dart';
import 'package:bebas/app/data/mahasiswa_model.dart';
import 'package:bebas/app/data/programkerjapost.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProgramkerjaController extends GetxController {
  //TODO: Implement ProgramkerjaController
  final formKey = GlobalKey<FormState>();
  TextEditingController judulCtrl = TextEditingController();
  TextEditingController bodyCtrl = TextEditingController();
  Rx<AllMahasiswa> allAnggota = AllMahasiswa().obs;
  late KelompokGet kelompok;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    detailAnggota();
  }

  @override
  void onClose() {
    super.onClose();
  }

  InsertProgramKerja(ProgramKerjaPost programkerja) async {
    final data = programkerja.toJson();
    final response = await ApiClient().post('api/program-kerja', data);
    if (response.statusCode == 200 || response.statusCode == 201) {
      Get.offNamed('beranda');
      Get.snackbar('Berhasi', '${response.data['message']}',
          backgroundColor: Colors.green, colorText: Colors.white);
    } else {
      Get.snackbar('Maaf', '${response.data['message']}',
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  detailAnggota() async {
    try {
      final anggota = kelompok.anggota;
      List<dynamic> data = [];
      for (int i = 0; i < kelompok.anggota!.length; i++) {
        final response =
            await ApiClient().get('api/mahasiswa/${anggota![i].nimMahasiswa}');
        print('response ni ::: ${response.data}');
        if (response.statusCode == 201 || response.statusCode == 200) {
          data.add(response.data);
        }
      }
      if (data.isNotEmpty) {
        allAnggota.value = AllMahasiswa.fromJson(data);
      }
    } catch (e) {
      print('Error : $e');
    }
  }

  void increment() => count.value++;
}

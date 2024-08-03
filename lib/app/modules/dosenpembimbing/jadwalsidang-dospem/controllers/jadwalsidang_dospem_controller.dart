import 'package:bebas/app/data/Helpers/apiclient.dart';
import 'package:bebas/app/data/model/kelompokget_model.dart';
import 'package:bebas/app/data/model/sidang_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JadwalsidangDospemController extends GetxController {
  //TODO: Implement JadwalsidangDospemController
  final formkey = GlobalKey<FormState>();
  TextEditingController titleCtrl = TextEditingController();
  TextEditingController bodyCtrl = TextEditingController();
  TextEditingController tanggalSidangCtrl = TextEditingController();
  Rx<AllSidangModel> allSidang = AllSidangModel().obs;
  var selectedDate = DateTime.now().obs;
  KelompokGet kelompok = Get.arguments;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    loadDataSidang();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void updateDate(DateTime newDate) {
    selectedDate.value = newDate;
  }

  loadDataSidang() async {
    try {
      final response = await ApiClient().get('api/sidang');
      List<dynamic> allSidangByid = [];
      List<dynamic> sidang = response.data;
      final sidangLength = sidang.length;
      for (int i = 0; i < sidangLength; i++) {
        if (sidang[i]['id_kelompok'] == kelompok.idKelompok) {
          allSidangByid.add(sidang[i]);
        }
      }
      if (allSidangByid.isNotEmpty) {
        allSidang.value = AllSidangModel.fromJson(allSidangByid);
      }
    } catch (e) {
      print('Error : $e');
    }
  }

  btnInput(SidangModel sidang) async {
    try {
      var data = sidang.toJson();
      final response = await ApiClient().post('api/sidang', data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar('Berhasil', response.data['message'],
            colorText: Colors.white, backgroundColor: Colors.green);
      } else {
        Get.snackbar('Berhasil', response.data['message'],
            colorText: Colors.white, backgroundColor: Colors.green);
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void increment() => count.value++;
}

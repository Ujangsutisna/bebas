import 'package:bebas/app/data/Helpers/apiclient.dart';
import 'package:bebas/app/data/model/kelompokget_model.dart';
import 'package:bebas/app/data/model/programkerja_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProgramkerjaDospemController extends GetxController {
  //TODO: Implement ProgramkerjaDospemController
  Rx<AllProgramKerjaGet> allProkerReview = AllProgramKerjaGet().obs;
  Rx<AllProgramKerjaGet> allProkerApprove = AllProgramKerjaGet().obs;
  final pageController = PageController();
  late KelompokGet kelompok;
  Rx<int> updateProker = 0.obs;
  var indexBtn = 0.obs;
  Rx<String> Dropdownvalue = 'approve'.obs;
  Rx<int> currenStepPageview = 0.obs;
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    viewProker();
  }

  @override
  void onClose() {
    super.onClose();
  }

  btnChangeView(int value) {
    pageController.animateToPage(
      value,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    currenStepPageview.value = value;
  }

  onChangedView(int value) {
    currenStepPageview.value = value;
  }

  viewProker() async {
    try {
      final response = await ApiClient().get('api/program-kerja');
      List<dynamic> data = response.data;
      List<dynamic> dataProkerReview = [];
      List<dynamic> dataProkerApprove = [];

      for (int i = 0; i < data.length; i++) {
        final proker = response.data[i];
        if (response.data[i]['id_kelompok'] == kelompok.idKelompok) {
          if (proker['approve'] == 'review') {
            dataProkerReview.add(response.data[i]);
          } else if (proker['approve'] == 'approve') {
            dataProkerApprove.add(response.data[i]);
          }
        }
      }
      print('approve ${dataProkerApprove}');
      if (dataProkerReview.isNotEmpty) {
        allProkerReview.value = AllProgramKerjaGet.fromJson(dataProkerReview);
      }
      if (dataProkerApprove.isNotEmpty) {
        allProkerApprove.value = AllProgramKerjaGet.fromJson(dataProkerApprove);
        print('id : ${allProkerApprove.value.programKerja![0].idProker}');
      }
    } catch (e) {
      print('error $e');
    }
  }

  insertUpdateStatus(int id, ProgramKerjaGet proker) async {
    try {
      var data = proker.toJsonStatus();
      print(data);
      print(id);
      final response =
          await ApiClient().put('api/program-kerja/$id/status', data);
      print('Response data${response.data}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        viewProker();
        Get.snackbar('Berhasil', response.data['message'],
            backgroundColor: Colors.green, colorText: Colors.white);
      } else {
        Get.snackbar('Berhasil', response.data['message'],
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (e) {
      print('Error : $e');
    }
  }

  void increment() => count.value++;
}

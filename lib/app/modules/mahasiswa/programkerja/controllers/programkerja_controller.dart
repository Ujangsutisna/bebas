// ignore_for_file: non_constant_identifier_names, unnecessary_overrides, deprecated_member_use
import 'package:bebas/app/data/Helpers/apiclient.dart';
import 'package:bebas/app/data/model/kelompokget_model.dart';
import 'package:bebas/app/data/model/programkerja_model.dart';
import 'package:bebas/app/data/model/programkerjapost.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProgramkerjaController extends GetxController {
  //TODO: Implement ProgramkerjaController
  KelompokGet kelompok = Get.arguments;
  Rx<AllProgramKerjaGet> allProkerReview = AllProgramKerjaGet().obs;
  Rx<AllProgramKerjaGet> allProkerApprove = AllProgramKerjaGet().obs;
  final formKeyInsert = GlobalKey<FormState>();
  final formKeyUpdate = GlobalKey<FormState>();
  TextEditingController judulCtrl = TextEditingController();
  TextEditingController bodyCtrl = TextEditingController();
  TextEditingController tanggalMulaiCtrl = TextEditingController();
  TextEditingController tanggalSelesaiCtrl = TextEditingController();
  Rx<bool> isLoadProker = true.obs;
  Rx<int> detailData = 0.obs;
  var indexdata = 0.obs;
  final pageController = PageController();

  Rx<int> currenStepPageview = 0.obs;
  var selectedDate = DateTime.now().obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    kelompok;

    viewProker();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void updateDate(DateTime newDate) {
    selectedDate.value = newDate;
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

  clearUpdateCtrl() {
    tanggalMulaiCtrl.clear();
    tanggalSelesaiCtrl.clear();
  }

  clearInserCtrl() {
    judulCtrl.clear();
    bodyCtrl.clear();
  }

  viewProker() async {
    try {
      if (kelompok.anggota == null) {
        // Handle error or wait for kelompok to be initialized
        print("kelompok belum diinisialisasi");
        return;
      }
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
      if (dataProkerReview.isNotEmpty) {
        allProkerReview.value = AllProgramKerjaGet.fromJson(dataProkerReview);
        isLoadProker.value = false;
      }
      if (dataProkerApprove.isNotEmpty) {
        allProkerApprove.value = AllProgramKerjaGet.fromJson(dataProkerApprove);
        isLoadProker.value = false;
      }
    } catch (e) {
      print('error $e');
    }
  }

  InsertProgramKerja(ProgramKerjaPost programkerja) async {
    try {
      final data = programkerja.toJson();
      final response = await ApiClient().post('api/program-kerja', data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        clearInserCtrl();
        viewProker();
        Get.snackbar('Berhasi', '${response.data['message']}',
            backgroundColor: Colors.green, colorText: Colors.white);
      } else {
        Get.snackbar('Maaf', '${response.data['message']}',
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (e) {
      print('Error:$e');
    }
  }

  updateTanggalProker(id, ProgramKerjaGet proker) async {
    try {
      final data = proker.toJsonUpdateTanggal();
      final response =
          await ApiClient().put('api/program-kerja/$id/done', data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        detailData.value = 0;
        indexdata.value = 0;
        clearUpdateCtrl();
        viewProker();
        Get.snackbar('Berhasi', '${response.data['message']}',
            backgroundColor: Colors.green, colorText: Colors.white);
      } else {
        Get.snackbar('Maaf', '${response.data['message']}',
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (e) {
      print('Error : $e');
    }
  }

  void increment() => count.value++;
}

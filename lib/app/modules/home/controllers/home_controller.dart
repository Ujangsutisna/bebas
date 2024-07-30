import 'package:bebas/app/data/Helpers/apiclient.dart';
import 'package:bebas/app/data/Helpers/user_info.dart';
import 'package:bebas/app/data/model/agenda_model.dart';
import 'package:bebas/app/data/model/kelompokget_model.dart';
import 'package:bebas/app/data/model/mahasiswa_model.dart';
import 'package:bebas/app/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  Rx<Mahasiswa> mahasiswa = Mahasiswa().obs;
  Rx<AllAgenda> allAgenda = AllAgenda().obs;
  Rx<KelompokGet> Kelompok = KelompokGet().obs;
  Rx<Allkelompokget> allKelompok = Allkelompokget().obs;
  Rx<DataUser> dataUser = DataUser().obs;
  var userType = ''.obs;
  final PageViewCtrl = PageController();
  var currentIndexPageView = 0.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    LoadData();
    fetchUserType();
  }

  @override
  void onReady() {
    LoadData();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onPageChanged(int index) {
    currentIndexPageView.value = index;
  }

  void btnPageChanged(int index) {
    PageViewCtrl.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    currentIndexPageView.value = index;
  }

  void fetchUserType() async {
    final userInfo = UserInfo();
    userType.value = (await userInfo.getTypeAccount()) ?? '';
  }

  LoadData() async {
    final userInfo = UserInfo();
    final userID = await userInfo.getUserID();
    final typeAccount = await userInfo.getTypeAccount();
    fetchUserType();
    print('Type akun ::: $typeAccount');
    LoadDataUser();

    _LoadKelompok(userID!);
    _LoadProgramKerja();
  }

  LoadDataUser() async {
    try {
      final response = await ApiClient().get('api/auth/user');
      if (response.statusCode == 200 || response.statusCode == 201) {
        dataUser.value = DataUser.fromJson(response.data['data']['summary']);
        print(dataUser.value.email);
      } else {}
    } catch (e) {
      print('Error load user: $e');
    }
  }

  _LoadProgramKerja() async {
    try {
      final response = await ApiClient().get('api/program-kerja');

      List<dynamic> dataArray = response.data;

      int lastIndex = dataArray.length;
      Map<String, dynamic>? LastDataByIDKelompok;

      for (int i = 0; i < lastIndex; i++) {
        final kelompok = response.data[i]['id_kelompok'];
        if (kelompok == Kelompok.value.idKelompok) {
          LastDataByIDKelompok = response.data[i];
        }
      }
      if (LastDataByIDKelompok != null) {
        // print(
        //     'DATA PROGRAM KERJA TERAKHIR YANG SESUAI :: $LastDataByIDKelompok');
      } else {
        // print('Tidak ada program kerja yang sesuai ditemukan');
      }
    } catch (e) {
      print('Error load proker: $e');
    }
  }

  _LoadKelompok(String userID) async {
    try {
      final response = await ApiClient().get('api/kelompok?nim=$userID');

      List<dynamic> dataArray = response.data;
      int lastIndex = dataArray.length - 1;

      if (response.data != null) {
        Kelompok.value = KelompokGet.fromJson(response.data[lastIndex]);
      }
    } catch (e) {
      print('Error kelompok : $e');
    }
  }
}

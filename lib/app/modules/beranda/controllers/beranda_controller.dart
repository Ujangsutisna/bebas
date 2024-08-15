// ignore_for_file: non_constant_identifier_names, unnecessary_overrides, avoid_print
import 'package:bebas/app/data/Helpers/apiclient.dart';
import 'package:bebas/app/data/Helpers/user_info.dart';
import 'package:bebas/app/data/model/agenda_model.dart';
import 'package:bebas/app/data/model/bimbingan_model.dart';
import 'package:bebas/app/data/model/mahasiswa_model.dart';
import 'package:bebas/app/data/model/kelompokget_model.dart';
import 'package:bebas/app/data/model/sidang_model.dart';
import 'package:bebas/app/data/model/user_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class BerandaController extends GetxController {
  Rx<Mahasiswa> mahasiswa = Mahasiswa().obs;
  Rx<AllAgenda> allAgenda = AllAgenda().obs;
  Rx<KelompokGet> Kelompok = KelompokGet().obs;
  Rx<Allkelompokget> allKelompok = Allkelompokget().obs;
  Rx<BimbinganModel> bimbingan = BimbinganModel().obs;
  Rx<AllSidangModel> allSidang = AllSidangModel().obs;
  Rx<DataUser> dataUser = DataUser().obs;
  Rx<bool> loadKelompok = true.obs;
  Rx<bool> loadBimbingan = true.obs;
  Rx<bool> loadSidang = true.obs;
  Rx<bool> loadUser = true.obs;

  List<dynamic> menuPageView = [
    'pendaftaran',
    'bimbingan',
    'jadwal sidang',
  ];

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
    super.onReady();
    LoadData();
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

  fetchUserType() async {
    final userInfo = UserInfo();
    userType.value = (await userInfo.getTypeAccount()) ?? '';
  }

  Future<void> LoadData() async {
    final userInfo = UserInfo();
    final userID = await userInfo.getUserID();
    final typeAccount = await userInfo.getTypeAccount();

    print('Type akun ::: $typeAccount');
    LoadDataUser();
    if (typeAccount == 'mahasiswa') {
      await _LoadKelompok(userID!);
      await _loadBimbingan();
      await _loadJadwalSidang();
    }
  }

  _loadJadwalSidang() async {
    try {
      final response = await ApiClient().get('api/sidang');
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<dynamic> dataSidang = response.data;
        final dataSidangLength = dataSidang.length;
        List<dynamic> allSidangById = [];
        for (int i = 0; i < dataSidangLength; i++) {
          if (dataSidang[i]['id_kelompok'] == Kelompok.value.idKelompok) {
            allSidangById.add(dataSidang[i]);
          }
        }
        if (allSidangById.isNotEmpty) {
          allSidang.value = AllSidangModel.fromJson(allSidangById);
        }
        loadSidang.value = false;
      }
    } catch (e) {
      print(e);
    }
  }

  LoadDataUser() async {
    try {
      final response = await ApiClient().get('api/auth/user');
      if (response.statusCode == 200 || response.statusCode == 201) {
        dataUser.value = DataUser.fromJson(response.data['data']['summary']);
        print(dataUser.value.email);
        loadUser.value = false;
      }
    } catch (e) {
      print('Error load user: $e');
    }
  }

  _loadBimbingan() async {
    try {
      final response = await ApiClient().get('api/bimbingan');
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<dynamic> dataBimbingan = response.data;

        final bimbinganLength = dataBimbingan.length;
        dynamic bimbinganLastByiD;
        for (int i = 0; i < bimbinganLength; i++) {
          if (dataBimbingan[i]['id_kelompok'] == Kelompok.value.idKelompok) {
            bimbinganLastByiD = response.data[i];
          }
        }

        if (bimbinganLastByiD != null) {
          bimbingan.value = BimbinganModel.fromJson(bimbinganLastByiD);
        }
        loadBimbingan.value = false;
      }
    } catch (e) {
      print(e);
    }
  }

  _LoadKelompok(String userID) async {
    try {
      final response = await ApiClient().get('api/kelompok?nim=$userID');
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<dynamic> dataArray = response.data;
        int lastIndex = dataArray.length - 1;

        if (response.data != null) {
          Kelompok.value = KelompokGet.fromJson(response.data[lastIndex]);
        }
        loadKelompok.value = false;
      }
    } catch (e) {
      print('Error kelompok : $e');
    }
  }

  void increment() => count.value++;
}

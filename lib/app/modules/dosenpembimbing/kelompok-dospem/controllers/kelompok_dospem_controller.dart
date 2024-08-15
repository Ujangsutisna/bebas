// ignore_for_file: non_constant_identifier_names, unnecessary_overrides, avoid_print

import 'package:bebas/app/data/Helpers/apiclient.dart';
import 'package:bebas/app/data/model/kelompokget_model.dart';
import 'package:bebas/app/data/model/mahasiswa_model.dart';
import 'package:bebas/app/data/model/user_model.dart';
import 'package:get/get.dart';

class KelompokDospemController extends GetxController {
  //TODO: Implement KelompokDospemController
  DataUser dataUser = Get.arguments[0];
  Rx<Allkelompokget> allKelompok = Allkelompokget().obs;
  Rx<AllMahasiswa> allMahasiswa = AllMahasiswa().obs;
  Rx<bool> loadKelompok = true.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    LoadKelompokByIDDospem();
  }

  @override
  void onClose() {
    super.onClose();
  }

  LoadKelompokByIDDospem() async {
    try {
      final userID = dataUser.ID;
      final response = await ApiClient().get('api/kelompok/');
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<dynamic> dataArray = response.data;
        List<dynamic> dataMahasiswa = [];
        int lastIndex = dataArray.length;
        List<dynamic> data = [];

        for (int i = 0; i < lastIndex; i++) {
          if (response.data[i]['id_dospem'] == userID &&
              dataArray[i]['approve'] != 'reject') {
            data.add(response.data[i]);
            final mahasiswa =
                await loadDataMahasiswa(dataArray[i]['nim_ketua_kelompok']);
            dataMahasiswa.add(mahasiswa);
          }
        }
        allKelompok.value = Allkelompokget.fromJson(data);
        loadKelompok.value = false;
        if (dataMahasiswa.isNotEmpty) {
          allMahasiswa.value = AllMahasiswa.fromJson(dataMahasiswa);
        }
      }
    } catch (e) {
      print('Error : $e');
    }
  }

  loadDataMahasiswa(String id) async {
    try {
      final response = await ApiClient().get('api/mahasiswa/$id');
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {}
    } catch (e) {
      print(e);
    }
  }

  void increment() => count.value++;
}

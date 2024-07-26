// ignore_for_file: non_constant_identifier_names, unnecessary_overrides, avoid_print

import 'package:bebas/app/data/Helpers/apiclient.dart';
import 'package:bebas/app/data/kelompokget_model.dart';
import 'package:bebas/app/data/user_model.dart';
import 'package:get/get.dart';

class KelompokDospemController extends GetxController {
  //TODO: Implement KelompokDospemController
  late DataUser dataUser;
  Rx<Allkelompokget> allKelompok = Allkelompokget().obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    LoadKelompokByIDDospem();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  LoadKelompokByIDDospem() async {
    try {
      final userID = dataUser.ID;
      final response = await ApiClient().get('api/kelompok');
      List<dynamic> dataArray = response.data;
      int lastIndex = dataArray.length;
      List<dynamic> data = [];
      for (int i = 0; i < lastIndex; i++) {
        if (response.data[i]['id_dospem'] == userID) {
          data.add(response.data[i]);
        }
      }
      allKelompok.value = Allkelompokget.fromJson(data);
    } catch (e) {
      print('Error : $e');
    }
  }

  void increment() => count.value++;
}

import 'package:bebas/app/data/Helpers/apiclient.dart';
import 'package:bebas/app/data/kelompokget_model.dart';
import 'package:bebas/app/data/mahasiswa_model.dart';
import 'package:get/get.dart';

class ReviewController extends GetxController {
  //TODO: Implement ReviewController
  late KelompokGet kelompok;
  Rx<AllMahasiswa> allAnggota = AllMahasiswa().obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    loadAnggotaBYID();
  }

  @override
  void onClose() {
    super.onClose();
  }

  loadAnggotaBYID() async {
    try {
      final anggotaLength = kelompok.anggota!.length;
      List<dynamic> anggotas = [];
      for (int i = 0; i < anggotaLength; i++) {
        final response = await ApiClient()
            .get('api/mahasiswa/${kelompok.anggota![i].nimMahasiswa}');
        if (response.statusCode == 200 || response.statusCode == 201) {
          anggotas.add(response.data);
        } else {
          print('data mahasiswa tidak di temukan');
        }
      }
      if (anggotas.isNotEmpty) {
        allAnggota.value = AllMahasiswa.fromJson(anggotas);
      }
      print('detail anggota ${anggotas}');
    } catch (e) {
      print('Error : $e');
    }
  }

  void increment() => count.value++;
}

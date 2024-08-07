import 'package:bebas/app/data/Helpers/apiclient.dart';
import 'package:bebas/app/data/model/kelompokget_model.dart';
import 'package:bebas/app/data/model/penilaian_model.dart';
import 'package:get/get.dart';

class PenilaianController extends GetxController {
  //TODO: Implement PenilaianController
  Rx<AllPenilaianModel> nilaiByIDAnggota = AllPenilaianModel().obs;
  Rx<AllPenilaianModel> nilaiKetua = AllPenilaianModel().obs;
  KelompokGet kelompok = Get.arguments;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  loadData() {
    loadNilaiKetua();
  }

  loadNilaiByNim(nim) async {
    try {
      final response = await ApiClient().get('api/nilai');
      List<dynamic> nilai = response.data;
      final nilaiLength = nilai.length;
      List<dynamic> nilaiNim = [];
      // nilai berdasarkan nim
      for (int i = 0; i < nilaiLength; i++) {
        if (nilai[i]['nim_mahasiswa'] == nim) {
          nilaiNim.add(nilai[i]);
        }
      }

      if (nilaiNim.isNotEmpty) {
        nilaiByIDAnggota.value = AllPenilaianModel.fromJson(nilaiNim);
      }
    } catch (e) {
      print(e);
    }
  }

  loadNilaiKetua() async {
    try {
      final response = await ApiClient().get('api/nilai');
      List<dynamic> nilai = response.data;
      final nilaiLength = nilai.length;
      List<dynamic> nilaiNim = [];
      final nim = kelompok.nimKetuaKelompok;
      // nilai berdasarkan nim
      for (int i = 0; i < nilaiLength; i++) {
        if (nilai[i]['nim_mahasiswa'] == nim) {
          nilaiNim.add(nilai[i]);
        }
      }

      if (nilaiNim.isNotEmpty) {
        nilaiKetua.value = AllPenilaianModel.fromJson(nilaiNim);
      }
    } catch (e) {
      print(e);
    }
  }

  void increment() => count.value++;
}

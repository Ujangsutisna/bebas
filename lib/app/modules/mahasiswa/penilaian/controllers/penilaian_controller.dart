import 'package:bebas/app/data/Helpers/apiclient.dart';
import 'package:bebas/app/data/model/kelompokget_model.dart';
import 'package:bebas/app/data/model/mahasiswa_model.dart';
import 'package:bebas/app/data/model/penilaian_model.dart';
import 'package:get/get.dart';

class PenilaianController extends GetxController {
  //TODO: Implement PenilaianController
  Rx<AllPenilaianModel> nilaiByIDAnggota = AllPenilaianModel().obs;
  Rx<AllPenilaianModel> nilaiKetua = AllPenilaianModel().obs;
  KelompokGet kelompok = Get.arguments;
  Rx<bool> isLoadPenilaian = true.obs;
  Rx<AllMahasiswa> allMahasiswa = AllMahasiswa().obs;
  RxList anggota = [].obs;
  List<AllPenilaianModel> allNilai = [];
  List<dynamic> pelaksanaanKKN = [
    'disiplin',
    'kreativitas',
    'tanggung_jawab',
  ];
  List<dynamic> laporanKKN = ['manfaat', 'tata_tulis', 'presentasi'];
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  @override
  void onReady() {
    super.onReady();
    loadNilaiByNim();
  }

  @override
  void onClose() {
    super.onClose();
  }

  loadData() {
    addAnngota();
  }

  addAnngota() {
    anggota.add(kelompok.nimKetuaKelompok);
    for (int i = 0; i < kelompok.anggota!.length; i++) {
      anggota.add(kelompok.anggota![i].nimMahasiswa);
    }
  }

  gradeNilai(int index) {
    String grade = 'null';
    double average = double.parse('${averageNilaiByNim(index)}');
    average < 50
        ? grade = 'E'
        : average < 60
            ? grade = 'D'
            : average < 70
                ? grade = 'C'
                : average < 80
                    ? grade = 'B'
                    : grade = 'A';
    return grade;
  }

  averageNilaiByNim(int index) {
    int total = 0;

    for (int i = 0; i < allNilai[index].penilaian!.length; i++) {
      int nilai = int.parse('${allNilai[index].penilaian![i].nilai}');
      total += nilai;
    }

    int length = pelaksanaanKKN.length + laporanKKN.length;
    double average = total / length;

    return average.toStringAsFixed(3);
  }

  loadNilaiByNim() async {
    try {
      final response = await ApiClient().get('api/nilai');
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<dynamic> nilai = response.data;
        final nilaiLength = nilai.length;
        List<dynamic> allDataAnggota = [];
        // anggota
        for (int a = 0; a < anggota.length; a++) {
          List<dynamic> nilaiByID = [];
          final nim = anggota[a];
          final mahasiswa = await loadDataMahasiswa(nim);
          allDataAnggota.add(mahasiswa);
          // nilai berdasarkan nim
          for (int i = 0; i < nilaiLength; i++) {
            if (nilai[i]['nim_mahasiswa'] == nim) {
              nilaiByID.add(nilai[i]);
            }
          }

          if (allDataAnggota.isNotEmpty) {
            allMahasiswa.value = AllMahasiswa.fromJson(allDataAnggota);
          }
          if (nilaiByID.isNotEmpty) {
            allNilai.add(AllPenilaianModel.fromJson(nilaiByID));
            isLoadPenilaian.value = false;
          } else {
            isLoadPenilaian.value = false;
          }
        }
      }
    } catch (e) {
      print(e);
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

// ignore_for_file: avoid_print, unnecessary_overrides

import 'package:bebas/app/data/Helpers/apiclient.dart';
import 'package:bebas/app/data/model/kelompokget_model.dart';
import 'package:bebas/app/data/model/mahasiswa_model.dart';
import 'package:bebas/app/data/model/penilaian_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PenilaianDospemController extends GetxController {
  //TODO: Implement PenilaianDospemController
  Rx<bool> isMenuNilai = false.obs;
  Rx<bool> isMenuTampilNilai = false.obs;
  KelompokGet kelompok = Get.arguments;
  final formKey = GlobalKey<FormState>();
  Rx<AllMahasiswa> allMahasiswa = AllMahasiswa().obs;
  Rx<Mahasiswa> mahasiswa = Mahasiswa().obs;
  List<dynamic> pelaksanaanKKN = [
    'disiplin',
    'kreativitas',
    'tanggung_jawab',
  ];
  List<dynamic> laporanKKN = ['manfaat', 'tata_tulis', 'presentasi'];
  List<AllPenilaianModel> allNilai = [];
  RxList pelaksanaanCtrl = [].obs;
  RxList laporanCtrl = [].obs;
  RxString averageNilai = ''.obs;
  RxList anggota = [].obs;
  RxList pelaksanaanSuksesPost = [].obs;
  RxList laporanSuksesPost = [].obs;
  RxString dropDown = ''.obs;
  Rx<dynamic> messagePost = ''.obs;
  Rx<bool> isPelaksanaanView = false.obs;
  Rx<bool> isPelaporanView = false.obs;
  Rx<bool> loadNilai = true.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    addAnngota();
    addCtrl();
    dropDown.value = kelompok.nimKetuaKelompok!;
    loadDataMahasiswaByID(dropDown.value);
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

  addCtrl() {
    for (int p = 0; p < pelaksanaanKKN.length; p++) {
      pelaksanaanCtrl.add(TextEditingController());
    }
    for (int l = 0; l < laporanKKN.length; l++) {
      laporanCtrl.add(TextEditingController());
    }
  }

  addAnngota() {
    anggota.add(kelompok.nimKetuaKelompok);
    for (int i = 0; i < kelompok.anggota!.length; i++) {
      anggota.add(kelompok.anggota![i].nimMahasiswa);
    }
  }

  clearController() {
    for (int i = 0; i < pelaksanaanCtrl.length; i++) {
      pelaksanaanCtrl[i].clear();
    }
    for (int i = 0; i < laporanCtrl.length; i++) {
      laporanCtrl[i].clear();
    }
  }

  clearAlert() {
    pelaksanaanSuksesPost.clear();
    laporanSuksesPost.clear();
  }

  gradeNilai(int index) {
    String grade = 'null';
    double average = averageNilaiByNim(index);
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
    return average;
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
          final mahasiswa = await responseLoadDataMhs(nim);
          allDataAnggota.add(mahasiswa);
          // nilai berdasarkan nim
          for (int i = 0; i < nilaiLength; i++) {
            if (nilai[i]['nim_mahasiswa'] == nim) {
              nilaiByID.add(nilai[i]);
            }
          }
          print(allDataAnggota);
          if (allDataAnggota.isNotEmpty) {
            allMahasiswa.value = AllMahasiswa.fromJson(allDataAnggota);
          }
          if (nilaiByID.isNotEmpty) {
            allNilai.add(AllPenilaianModel.fromJson(nilaiByID));
            loadNilai.value = false;
          } else {
            loadNilai.value = false;
          }
        }
      }
    } catch (e) {
      print(e);
    }
  }

  responseLoadDataMhs(String id) async {
    try {
      final response = await ApiClient().get('api/mahasiswa/$id');
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
    }
  }

  loadDataMahasiswaByID(String nim) async {
    try {
      final response = await responseLoadDataMhs(nim);
      response != null ? mahasiswa.value = Mahasiswa.fromJson(response) : null;
    } catch (e) {
      print(e);
    }
  }

  btnInsert(PenilaianModel penilaian) async {
    try {
      var data = penilaian.toJson();
      final response = await ApiClient().post('api/nilai', data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        messagePost.value = 'Berhasil';
      } else {
        messagePost.value = 'Gagal';
      }
    } catch (e) {
      print(e);
    }
  }

  void increment() => count.value++;
}

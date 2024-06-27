import 'dart:convert';

import 'package:bebas/app/data/model/Agenda.dart';
import 'package:bebas/app/data/model/Mahasiswa.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BerandaController extends GetxController {
  //TODO: Implement BerandaController
  // late Mahasiswa mahasiswa;

  var mahasiswa = Rx<Mahasiswa?>(null);

  var agendalist = <Agenda>[].obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    _LoadData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // ignore: non_constant_identifier_names
  Future<void> _LoadData() async {
    _loadMahasiswa();
    _loadListAgenda();
  }

  Future<void> _loadMahasiswa() async {
    try {
      // Baca file JSON lokal
      String jsonString =
          await rootBundle.loadString('lib/app/data/json/data.json');
      // Parsing JSON dan inisialisasi objek Mahasiswa
      final jsonData = json.decode(jsonString);

      final List<dynamic> mahasiswaData = jsonData['mahasiswa'];

      if (mahasiswaData[0] != null) {
        final Mahasiswa mahasiswa1 = Mahasiswa.fromJson(mahasiswaData[0]);
        mahasiswa.value = mahasiswa1;
      } else {
        print('data mahasiswa kosong');
      }
      // Perbarui UI setelah data dimuat

      update();
    } catch (e) {
      // Tangani kesalahan jika ada
      print("Error: $e");
    }
  }

  Future<void> _loadListAgenda() async {
    try {
      // Baca file JSON lokal
      String jsonString =
          await rootBundle.loadString('lib/app/data/json/data.json');
      // Parsing JSON dan inisialisasi objek Mahasiswa

      final jsonData = json.decode(jsonString)['AgendaKKN'] as List<dynamic>;

      final List<Agenda> agendas =
          jsonData.map((item) => Agenda.fromJson(item)).toList();
      agendalist.assignAll(agendas);

      // Perbarui UI setelah data dimuat
      update();
    } catch (e) {
      // Tangani kesalahan jika ada
      print("Error: $e");
    }
  }

  void increment() => count.value++;
}

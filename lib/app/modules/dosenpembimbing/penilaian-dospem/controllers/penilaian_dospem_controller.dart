import 'package:bebas/app/data/model/kelompokget_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PenilaianDospemController extends GetxController {
  //TODO: Implement PenilaianDospemController
  KelompokGet kelompok = Get.arguments;
  List<dynamic> pelaksanaanKKN = [
    'disiplin',
    'Kreativitas',
    'tanggung_jawab',
    'manfaat',
    'tata_tulis',
    'presentasi'
  ];
  final formKey = GlobalKey<FormState>();
  RxList diSiplinCtrl = [].obs;
  RxList kreativitasCtrl = [].obs;
  RxList tanggungJawabCtrl = [].obs;
  RxList manfaatCtrl = [].obs;
  RxList tataTulisCtrl = [].obs;
  RxList presentasiCtrl = [].obs;

  List<bool> isdetailData = [false, false, false].obs;
  RxList anggota = [].obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    addAnngota();

    for (int i = 0; i < anggota.length; i++) addCtrl();
  }

  @override
  void onClose() {
    super.onClose();
  }

  addCtrl() {
    diSiplinCtrl.add(TextEditingController());
    kreativitasCtrl.add(TextEditingController());
    tanggungJawabCtrl.add(TextEditingController());
    manfaatCtrl.add(TextEditingController());
    tataTulisCtrl.add(TextEditingController());
    presentasiCtrl.add(TextEditingController());
  }

  addAnngota() {
    anggota.add(kelompok.nimKetuaKelompok);
    for (int i = 0; i < kelompok.anggota!.length; i++) {
      anggota.add(kelompok.anggota![i].nimMahasiswa);
    }
  }

  void increment() => count.value++;
}

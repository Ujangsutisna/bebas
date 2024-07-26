// ignore_for_file: invalid_use_of_protected_member, non_constant_identifier_names

import 'package:bebas/app/data/Helpers/apiclient.dart';
import 'package:bebas/app/data/Helpers/user_info.dart';
import 'package:bebas/app/data/mahasiswa_model.dart';

import 'package:bebas/app/data/kelompokpost_model.dart';
import 'package:bebas/app/modules/beranda/controllers/beranda_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DaftarkknController extends GetxController {
  //TODO: Implement DaftarkknController

  final List<GlobalKey<FormState>> formkey = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];
  Rx<Mahasiswa> mahasiswa = Mahasiswa().obs;
  RxList<TextEditingController> NimAnggotactrl = <TextEditingController>[].obs;
  RxList<TextEditingController> NamaAnggotactrl = <TextEditingController>[].obs;
  final NimKetuaCtrl = TextEditingController().obs;
  final NamaLengkapctrl = TextEditingController().obs;
  final Programstudictrl = TextEditingController().obs;
  final Kelasctrl = TextEditingController().obs;
  final TglLahirctrl = TextEditingController().obs;
  final Emailctrl = TextEditingController().obs;
  final Telpctrl = TextEditingController().obs;
  //lokasi
  final TanggalMulaictrl = TextEditingController();
  final TanggalSelesaictrl = TextEditingController();
  final Jalanctrl = TextEditingController();
  final Desactrl = TextEditingController();
  final RtRwctrl = TextEditingController();
  final Kecctrl = TextEditingController();
  final KabKotactrl = TextEditingController();
  final Penanggungctrl = TextEditingController();
  final TelpPenanggungctrl = TextEditingController();

  var token = ''.obs;

  var currentstep = 0.obs;
  var isChecked = false.obs;
  var isCheckedNim = false.obs;
  var isCheckedNama = false.obs;
  var isError = false.obs;
  var selectedDate = DateTime.now().obs;

  final count = 0.obs;
  @override
  void onInit() {
    addID();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void updateDate(DateTime newDate) {
    selectedDate.value = newDate;
  }

  void removeItem(int index) {
    NimAnggotactrl[index].clear(); // Dispose the controller
    NimAnggotactrl[index].dispose(); // Dispose the controller
    NimAnggotactrl.removeAt(index); // Remove the item from the list
    NamaAnggotactrl[index].clear(); // Dispose the controller
    NamaAnggotactrl[index].dispose(); // Dispose the controller
    NamaAnggotactrl.removeAt(index); // Remove the item from the list
    update();
  }

  void addItem() {
    NimAnggotactrl.add(TextEditingController());
    NamaAnggotactrl.add(TextEditingController());
    update();
  }

  void PostServer() {
    final nimAnggota = NimAnggotactrl;
    final nimKetua = NimKetuaCtrl;
    List<String> anggota = [];
    String lokasi =
        '${Jalanctrl.value.text}  ${RtRwctrl.value.text} ${Desactrl.value.text} ${Kecctrl.value.text} ${KabKotactrl.value.text}';
    for (int i = 0; i < nimAnggota.length; i++) {
      anggota.add(nimAnggota[i].value.text);
    }

    KelompokPost kelompokPost = KelompokPost(
        anggota: anggota,
        lokasiKkn: lokasi,
        jenis: 'KKN',
        penanggungJawab: Penanggungctrl.text,
        nomorTelephonePenanggungJawab: TelpPenanggungctrl.text,
        tanggalMulai: TanggalMulaictrl.text,
        tanggalAkhir: TanggalSelesaictrl.text);

    InsertKelompok(kelompokPost);
  }

  addID() async {
    final userInfo = UserInfo();
    final userID = await userInfo.getUserID();
    getMahasiswaByID(userID!).then((value) {
      if (value) {
        NimKetuaCtrl.value.text = mahasiswa.value.nim!;
        NamaLengkapctrl.value.text = mahasiswa.value.nama!;
        Programstudictrl.value.text = mahasiswa.value.prodi!.namaProdi!;
        Kelasctrl.value.text = mahasiswa.value.kelas!.namaKelas!;
        TglLahirctrl.value.text = mahasiswa.value.tanggalLahir!;
        Emailctrl.value.text = mahasiswa.value.user!.email!;
        Telpctrl.value.text = mahasiswa.value.nomorTelephone!;
      } else {
        Get.snackbar('Maaf', 'Gagal load data',
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    });
  }

  clearTextCtrl() {
    NimKetuaCtrl.value.clear();
    NamaLengkapctrl.value.clear();
    Programstudictrl.value.clear();
    Kelasctrl.value.clear();
    TglLahirctrl.value.clear();
    Emailctrl.value.clear();
    Telpctrl.value.clear();

    TanggalSelesaictrl.clear();
    Jalanctrl.clear();
    Desactrl.clear();
    RtRwctrl.clear();
    Kecctrl.clear();
    KabKotactrl.clear();
    Penanggungctrl.clear();
    TelpPenanggungctrl.clear();
  }

  getMahasiswaByID(String Nim) async {
    try {
      bool isTrue = false;
      final response = await ApiClient().get('api/mahasiswa/$Nim');
      if (response.statusCode == 404) {
        // not found data
      } else {
        mahasiswa.value = Mahasiswa.fromJson(response.data);

        isTrue = true;
      }
      print(mahasiswa.value.nim);
      return isTrue;
    } catch (e) {
      print('Error : $e');
    }
  }

  InsertKelompok(KelompokPost kelompok) async {
    var data = kelompok.toJson();
    final response = await ApiClient().post('api/kelompok/', data);

    if (response.statusCode == 201 || response.statusCode == 200) {
      Get.offNamed('beranda');
      Get.snackbar('Berhasil', '${response.data['message']}',
          backgroundColor: Colors.green, colorText: Colors.white);
      clearTextCtrl();
      final BerandaController berandaController = Get.find();
      berandaController.LoadData();
    } else {
      Get.snackbar('Maaf', '${response.data['message']}',
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  void increment() => count.value++;
}

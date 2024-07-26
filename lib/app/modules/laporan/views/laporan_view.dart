import 'package:bebas/app/data/Laporanpost.dart';
import 'package:bebas/app/data/kelompokget_model.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/laporan_controller.dart';

var bluedark = const Color(0xff2b3f85);
var bluelight = const Color(0xff32529f);
var yellowglobal = const Color.fromRGBO(248, 171, 29, 1);
var redglobal = const Color(0xffea1e35);
var greenglo = const Color(0xff06880b);

class LaporanView extends GetView<LaporanController> {
  const LaporanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    KelompokGet kelompok = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'LaporanView',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: const Color.fromARGB(31, 88, 88, 88),
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            _DataKelompok(kelompok),
            const SizedBox(
              height: 10,
            ),
            CardFormInput()
          ],
        ),
      ),
    );
  }

  _DataKelompok(KelompokGet kelompok) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      padding: const EdgeInsets.all(10),
      child: Column(children: [
        const Text('Detail Kelompok',
            style: TextStyle(fontWeight: FontWeight.w700)),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const SizedBox(width: 100, child: Text('Nim Ketua')),
            const Text(': '),
            Text('${kelompok.nimKetuaKelompok}'),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 100, child: Text('Lokasi')),
            const Text(': '),
            Expanded(child: Text('${kelompok.lokasiKkn}')),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Center(
            child: Text(
          'Data anggota',
          style: TextStyle(fontWeight: FontWeight.w700),
        )),
        const Divider(),
        for (int i = 0; i < kelompok.anggota!.length; i++)
          Row(
            children: [
              SizedBox(width: 100, child: Text('Nim anggota ${i + 1}')),
              const Text(': '),
              Text('${kelompok.anggota![i].nimMahasiswa}'),
            ],
          ),
        const SizedBox(
          height: 10,
        ),
      ]),
    );
  }

  CardFormInput() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Form(
        key: controller.formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Form laporan',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w800,
              ),
            ),
            Divider(),
            const SizedBox(height: 10),
            _textInputField(1, controller.titleCtrl, 'Title program kerja'),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Body',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            _textInputField(4, controller.bodyCtrl, ''),
            const SizedBox(
              height: 10,
            ),
            _buttoninsert(),
          ],
        ),
      ),
    );
  }

  _textInputField(int lines, ctrl, String Label) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Data tidak boleh kosong';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: Label,
      ),
      maxLines: lines,
      cursorHeight: 5.0,
      cursorWidth: 5.0,
      cursorRadius: const Radius.circular(50),
      controller: ctrl,
    );
  }

  _buttoninsert() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () async {
          if (controller.formkey.currentState!.validate()) {
            LaporanPost laporanpost = LaporanPost(title:controller.titleCtrl.text,body: controller.bodyCtrl.text);
            await controller.inputLaporan(laporanpost);
          }
        },
        child: const Text('Simpan'),
      ),
    );
  }
}

// ignore_for_file: non_constant_identifier_names, use_super_parameters

import 'package:bebas/app/data/model/kelompokget_model.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/kelompok_dospem_controller.dart';

var bluedark = const Color(0xff2b3f85);
var bluelight = const Color(0xff32529f);
var yellowglobal = const Color.fromRGBO(248, 171, 29, 1);
var redglobal = const Color(0xffea1e35);
var greenglo = const Color(0xff06880b);

class KelompokDospemView extends GetView<KelompokDospemController> {
  const KelompokDospemView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String nextpage = Get.arguments[1];

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Data Kelompok ${nextpage}',
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
          child: Obx(() {
            final data = controller.allKelompok.value.kelompokGet;

            return data == null
                ? const Center(child: CircularProgressIndicator())
                : ListView(
                    children: [
                      for (int i = 0;
                          i < controller.allKelompok.value.kelompokGet!.length;
                          i++)
                        _CardDataKelompok(data[i], nextpage)
                    ],
                  );
          }),
        ));
  }

  _CardDataKelompok(KelompokGet kelompok, nextpage) {
    return MaterialButton(
      onPressed: () {
        if (nextpage == 'Program kerja') {
          Get.toNamed('programkerja-dospem', arguments: kelompok);
        } else if (nextpage == 'Bimbingan') {
          Get.toNamed('bimbingan-dospem', arguments: kelompok);
        } else if (nextpage == 'Laporan') {
          Get.toNamed('laporan-dospem', arguments: kelompok);
        } else if (nextpage == 'Jadwal sidang') {
          Get.toNamed('jadwalsidang-dospem', arguments: kelompok);
        } else if (nextpage == 'Penilaian') {
           Get.toNamed('penilaian-dospem', arguments: kelompok);
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            border: Border.all(width: 0.2),
            borderRadius: const BorderRadius.all(Radius.circular(6))),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: bluedark,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(6),
                      topRight: Radius.circular(6))),
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: Center(
                  child: Text('Ketua Kelompok ${kelompok.nimKetuaKelompok}',
                      style: const TextStyle(color: Colors.white)))),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 15, 10, 10),
            child: Column(
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 150,
                      child: Text('Penanggung Jawab'),
                    ),
                    const SizedBox(
                      child: Text(':  '),
                    ),
                    Expanded(child: Text('${kelompok.penanggungJawab}'))
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const SizedBox(
                      width: 150,
                      child: Text('No Penanggung Jawab'),
                    ),
                    const SizedBox(
                      child: Text(':  '),
                    ),
                    Expanded(
                        child:
                            Text('${kelompok.nomorTelephonePenanggungJawab}'))
                  ],
                ),
                const SizedBox(height: 8),
                const Divider(),
                for (int i = 0; i < kelompok.anggota!.length; i++)
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        width: 150,
                        child: const Text('Nama Anggota'),
                      ),
                      const SizedBox(
                        child: Text(':  '),
                      ),
                      Expanded(
                          child: Text('${kelompok.anggota![i].detail!.nama}')),
                    ],
                  ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

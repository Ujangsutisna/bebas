import 'package:bebas/app/data/model/kelompokget_model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/penilaian_controller.dart';

var bluedark = const Color(0xff2b3f85);
var bluelight = const Color(0xff32529f);
var yellowglobal = const Color.fromRGBO(248, 171, 29, 1);
var redglobal = const Color(0xffea1e35);
var greenglo = const Color(0xff06880b);

class PenilaianView extends GetView<PenilaianController> {
  const PenilaianView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    KelompokGet kelompok = Get.arguments;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Penilaian'),
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(bottom: BorderSide(width: 0.2))),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _rowData('Nim Ketua ', kelompok.nimKetuaKelompok),
                        _rowData('Penangung ', kelompok.penanggungJawab),
                        _rowData('Lokasi ', kelompok.lokasiKkn),
                        _rowData('Status ', kelompok.approve),
                        SizedBox(
                            child: Center(
                                child: Text('Anggota',
                                    style: TextStyle(
                                        color: bluedark,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14)))),
                        const Divider(),
                        for (int i = 0; i < kelompok.anggota!.length; i++)
                          Container(
                            height: 35,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('${kelompok.anggota![i].detail!.nim}'),
                                TextButton(
                                    onPressed: () {
                                      final nilai = controller
                                          .nilaiByIDAnggota.value.penilaian;
                                      if (nilai != null) {
                                        controller
                                            .nilaiByIDAnggota.value.penilaian!
                                            .clear();
                                      }
                                      final nim =
                                          kelompok.anggota![i].detail!.nim;
                                      controller.loadNilaiByNim(nim);
                                      Get.defaultDialog(
                                          title:
                                              'Nilai ${kelompok.anggota![i].detail!.nama}',
                                          titleStyle: TextStyle(
                                              color: bluedark,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                          radius: 5,
                                          content: Container(
                                            padding: const EdgeInsets.fromLTRB(
                                                20, 10, 20, 20),
                                            child: Obx(() {
                                              final nilai = controller
                                                  .nilaiByIDAnggota
                                                  .value
                                                  .penilaian;
                                              return controller.nilaiByIDAnggota
                                                          .value.penilaian !=
                                                      null
                                                  ? Column(
                                                      children: [
                                                        for (int i = 0;
                                                            i < nilai!.length;
                                                            i++)
                                                          _rowDataNilai(
                                                              '${nilai[i].jenisNilai}',
                                                              nilai[i].nilai)
                                                      ],
                                                    )
                                                  : const Center(child:Text('Nilai kosong'));
                                            }),
                                          ));
                                    },
                                    child: Text(
                                        '${kelompok.anggota![i].detail!.nama}')),
                              ],
                            ),
                          )
                      ])),
              const SizedBox(height: 15),
              SizedBox(
                height: 30,
                child: Text(
                  'Nilai Ketua kelompok',
                  style:
                      TextStyle(color: bluedark, fontWeight: FontWeight.w600),
                ),
              ),
              Expanded(
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    padding: const EdgeInsets.all(20),
                    child: Obx(() {
                      final nilai = controller.nilaiKetua.value.penilaian;
                      return controller.nilaiKetua.value.penilaian != null
                          ? Column(
                              children: [
                                for (int i = 0; i < nilai!.length; i++)
                                  _rowDataNilai(
                                      '${nilai[i].jenisNilai}', nilai[i].nilai)
                              ],
                            )
                          : const Center(child: Text('Anda belum ada nilai'));
                    })),
              )
            ],
          ),
        ));
  }

  _rowDataNilai(String label, dynamic value) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
            width: 150, child: Text(label, style: TextStyle(color: bluedark))),
        Expanded(
            child: SizedBox(width: double.infinity, child: Text('${value}')))
      ]),
    );
  }

  _rowData(String label, dynamic value) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
            width: 100,
            child: Text(label,
                style: const TextStyle(fontWeight: FontWeight.w600))),
        const Text(':  '),
        Expanded(
            child: SizedBox(width: double.infinity, child: Text('${value}')))
      ]),
    );
  }
}

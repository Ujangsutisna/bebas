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
    return Scaffold(
        appBar: AppBar(
          title: const Text('Penilaian'),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
            child: Column(
              children: [
                Center(
                    child: Text(
                  'Nilai Akhir KKN',
                  style: TextStyle(
                      color: bluedark,
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                )),
                const SizedBox(
                  height: 20,
                ),
                _loadDataNilai(context)
              ],
            ),
          ),
        ));
  }

  _loadDataNilai(context) {
    return Obx(() {
      final mahasiswa = controller.allMahasiswa.value.mahasiswa;
      final allNilai = controller.allNilai;
      final isLoad = controller.isLoadPenilaian.value;
      return isLoad
          ? SizedBox(
              height: MediaQuery.of(context).size.height*0.7,
              child: const Center(
                child: CircularProgressIndicator(),
              ))
          : controller.allNilai.isNotEmpty
              ? SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                            headingRowColor: MaterialStateProperty.resolveWith(
                                (Set<MaterialState> states) {
                              return bluedark;
                            }),
                            columns: [
                              const DataColumn(
                                  label: Text(
                                'Kategori',
                                style: TextStyle(color: Colors.white),
                              )),
                              for (int i = 0; i < allNilai.length; i++)
                                DataColumn(
                                    label: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        '${mahasiswa != null ? mahasiswa[i].nama : ''}',
                                        style: const TextStyle(
                                            color: Colors.white)),
                                    Text('( ${allNilai[i].penilaian![0].nim} )',
                                        style: const TextStyle(
                                            color: Colors.white)),
                                  ],
                                ))
                            ],
                            rows: [
                              DataRow(
                                  color: MaterialStateProperty.resolveWith(
                                      (Set<MaterialState> states) {
                                    return const Color.fromARGB(
                                        255, 227, 227, 227);
                                  }),
                                  cells: [
                                    const DataCell(Text('Pelaksanaan KKN')),
                                    for (int i = 0; i < allNilai.length; i++)
                                      const DataCell(Text('')),
                                  ]),
                              for (int k = 0;
                                  k < controller.pelaksanaanKKN.length;
                                  k++)
                                DataRow(cells: [
                                  DataCell(
                                      Text('${controller.pelaksanaanKKN[k]}')),
                                  for (int i = 0; i < allNilai.length; i++)
                                    for (int p = 0;
                                        p < allNilai[i].penilaian!.length;
                                        p++)
                                      if (allNilai[i]
                                              .penilaian![p]
                                              .jenisNilai ==
                                          controller.pelaksanaanKKN[k])
                                        DataCell(Center(
                                          child: Text(
                                              '${allNilai[i].penilaian![p].nilai}'),
                                        ))
                                ]),
                              DataRow(
                                  color: MaterialStateProperty.resolveWith(
                                      (Set<MaterialState> states) {
                                    return const Color.fromARGB(
                                        255, 227, 227, 227);
                                  }),
                                  cells: [
                                    const DataCell(Text('Laporan KKN')),
                                    for (int i = 0; i < allNilai.length; i++)
                                      const DataCell(Text('')),
                                  ]),
                              for (int k = 0;
                                  k < controller.laporanKKN.length;
                                  k++)
                                DataRow(cells: [
                                  DataCell(Text('${controller.laporanKKN[k]}')),
                                  for (int i = 0; i < allNilai.length; i++)
                                    for (int p = 0;
                                        p < allNilai[i].penilaian!.length;
                                        p++)
                                      if (allNilai[i]
                                              .penilaian![p]
                                              .jenisNilai ==
                                          controller.laporanKKN[k])
                                        DataCell(Center(
                                          child: Text(
                                              '${allNilai[i].penilaian![p].nilai}'),
                                        ))
                                ]),
                              DataRow(
                                  color: MaterialStateProperty.resolveWith(
                                      (Set<MaterialState> states) {
                                    return const Color.fromARGB(
                                        255, 227, 227, 227);
                                  }),
                                  cells: [
                                    const DataCell(Text(
                                      'Rata rata',
                                    )),
                                    for (int i = 0; i < allNilai.length; i++)
                                      DataCell(Center(
                                          child: Text(
                                        controller.averageNilaiByNim(i),
                                      )))
                                  ]),
                              DataRow(
                                  color: MaterialStateProperty.resolveWith(
                                      (Set<MaterialState> states) {
                                    return bluedark;
                                  }),
                                  cells: [
                                    const DataCell(Text(
                                      'Grade',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                    for (int i = 0; i < allNilai.length; i++)
                                      DataCell(Center(
                                          child: Text(controller.gradeNilai(i),
                                              style: const TextStyle(
                                                  color: Colors.white))))
                                  ])
                            ]),
                      ),
                    ],
                  ),
                )
              : const Center(child: Text('Nilai kosong'));
    });
  }
}

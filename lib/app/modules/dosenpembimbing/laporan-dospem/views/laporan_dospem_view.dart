import 'package:bebas/app/data/model/laporan_model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../controllers/laporan_dospem_controller.dart';

var bluedark = const Color(0xff2b3f85);
var bluelight = const Color(0xff32529f);
var yellowglobal = const Color.fromRGBO(248, 171, 29, 1);
var redglobal = const Color(0xffea1e35);
var greenglo = const Color(0xff06880b);

class LaporanDospemView extends GetView<LaporanDospemController> {
  const LaporanDospemView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Laporan',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: Obx(() {
            final laporan = controller.allLaporan.value.laporan;

            if (laporan != null) {
              return ListView(
                children: [
                  for (int i = 0; i < laporan.length; i++)
                    viewLoadData(laporan[i], i, context)
                ],
              );
            } else if (laporan == null && !controller.isdatalaporan.value) {
              return const Center(
                child: Text('Kelompok ini belum simpan laporan'),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
        ));
  }

  viewLoadData(LaporanModel laporan, int index, BuildContext context) {
    return Obx(() {
      return Container(
        margin: const EdgeInsets.only(
          bottom: 10,
        ),
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: Column(
          children: [
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Column(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        color: greenglo,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${index + 1}',
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '${laporan.approve}',
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                      onPressed: () {
                        final fileName = laporan.fileLaporan;
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return SfPdfViewer.network(
                                  'https://kkn.proyek.org/storage/$fileName');
                            });
                      },
                      child: Row(
                        children: [
                          Icon(Icons.remove_red_eye, color: greenglo),
                          const SizedBox(
                            width: 2,
                          ),
                          Text("pdf", style: TextStyle(color: greenglo))
                        ],
                      ))
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${laporan.judulLaporan}',
                      style: TextStyle(
                          color: greenglo, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text('${laporan.bodyLaporan}'),
                    const SizedBox(height: 5),
                    if (controller.isDetailData.value &&
                        index + 1 == controller.indexDetailData.value)
                      Column(children: [
                        _DropdownList(),
                        const SizedBox(height: 5),
                        _btnUpdateStatus(context, laporan.idLaporan)
                      ]),
                    IconButton(
                        onPressed: () {
                          !controller.isDetailData.value
                              ? controller.isDetailData.value = true
                              : controller.isDetailData.value = false;

                          controller.indexDetailData.value = index + 1;
                        },
                        icon: AnimatedRotation(
                            turns:
                                index + 1 == controller.indexDetailData.value &&
                                        controller.isDetailData.value
                                    ? 0.50
                                    : 0,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            child: const Icon(Icons.arrow_drop_down_rounded)))
                  ],
                ),
              ),
            ]),
          ],
        ),
      );
    });
  }

  _DropdownList() {
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Text(
              'Perbaharui ',
              style: TextStyle(
                  color: bluedark, fontWeight: FontWeight.w500, fontSize: 12),
            ),
          ),
          const SizedBox(width: 5),
          DropdownButton<String>(
              alignment: Alignment.bottomRight,
              underline: const SizedBox(),
              value: controller.Dropdownvalue.value,
              items: <String>['approve', 'reject']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                    value: value, child: Text(value));
              }).toList(),
              onChanged: (String? newValue) {
                controller.Dropdownvalue.value = newValue!;
              },
              style: const TextStyle(
                  fontSize: 12, color: Color.fromARGB(255, 21, 21, 21))),
        ],
      );
    });
  }

  _btnUpdateStatus(context, int? id) {
    return SizedBox(
        height: 40,
        width: double.infinity,
        child: MaterialButton(
            color: greenglo,
            onPressed: () {
              Get.defaultDialog(
                  radius: 5,
                  cancelTextColor: greenglo,
                  buttonColor: greenglo,
                  confirm: MaterialButton(
                    color: greenglo,
                    onPressed: () {
                      final idLaporan = id;
                      final approve = controller.Dropdownvalue.value;
                      final idKelompok = controller.kelompok.idKelompok;
                      LaporanModel laporan = LaporanModel(approve: approve,idKelompok: idKelompok);
                      controller.btnUpdateStatus(idLaporan, laporan);
                    },
                    child: const Text('Iya', style: TextStyle(color: Colors.white)),
                  ),
                  cancel: MaterialButton(
                    color: redglobal,
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text('Batal',  style: TextStyle(color: Colors.white)),
                  ),
                  titleStyle:
                      TextStyle(color: greenglo, fontWeight: FontWeight.w600),
                  title: 'Maaf',
                  content: Text(
                      'apakah anda yakin untuk ${controller.Dropdownvalue.value}'));
            },
            child: const Text('perbaharui',
                style: TextStyle(color: Colors.white))));
  }
}

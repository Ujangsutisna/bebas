// ignore_for_file: prefer_is_empty, use_super_parameters

import 'package:bebas/app/data/model/penilaian_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../controllers/penilaian_dospem_controller.dart';

var bluedark = const Color(0xff2b3f85);
var bluelight = const Color(0xff32529f);
var yellowglobal = const Color.fromRGBO(248, 171, 29, 1);
var redglobal = const Color(0xffea1e35);
var greenglo = const Color(0xff06880b);

class PenilaianDospemView extends GetView<PenilaianDospemController> {
  const PenilaianDospemView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final mdSize = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Penilaian',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                  onPressed: () {
                    controller.clearAlert();
                    controller.isMenuNilai.value
                        ? controller.isMenuNilai.value = false
                        : controller.isMenuNilai.value = true;
                  },
                  child: const Text('Input Nilai')),
              Obx(() {
                return controller.isMenuNilai.value
                    ? Container(
                        height: mdSize.height * 0.8,
                        color: Colors.white,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              _dropDownMenu(),
                              _dataMahasiswa(),
                              Form(
                                  key: controller.formKey,
                                  child: Column(
                                    children: [
                                      _cardPenilaian(),
                                      _btnInsert(),
                                    ],
                                  ))
                            ],
                          ),
                        ),
                      )
                    : const SizedBox();
              }),
              TextButton(
                  onPressed: () {
                    controller.isMenuTampilNilai.value
                        ? controller.isMenuTampilNilai.value = false
                        : controller.isMenuTampilNilai.value = true;
                  },
                  child: const Text('Lihat Nilai')),
              _loadDataNilai()
            ],
          ),
        ));
  }

  _loadDataNilai() {
    return Obx(() {
      final allNilai = controller.allNilai;
      return controller.isMenuTampilNilai.value
          ? Container(
              padding: const EdgeInsets.all(20),
              child: controller.allNilai.isNotEmpty
                  ? Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              right: BorderSide(width: 0.2),
                              left: BorderSide(width: 0.2))),
                      child: Column(
                        children: [
                          _rowData('Penilaian', '', bluedark),
                          _rowData('Pelaksanaan KKN', '',
                              const Color.fromARGB(255, 237, 237, 237),
                              isKategori: true),
                          SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: DataTable(columns: [
                                const DataColumn(
                                    label: SizedBox(
                                        width: 100, child: Text('Kategori'))),
                                for (int i = 0; i < allNilai.length; i++)
                                  DataColumn(
                                      label: Text(
                                          '${allNilai[i].penilaian![0].nim}'))
                              ], rows: [
                                for (int k = 0;
                                    k < controller.pelaksanaanKKN.length;
                                    k++)
                                  DataRow(cells: [
                                    DataCell(Text(
                                        '${controller.pelaksanaanKKN[k]}')),
                                    for (int i = 0; i < allNilai.length; i++)
                                      for (int p = 0;
                                          p < allNilai[i].penilaian!.length;
                                          p++)
                                        if (allNilai[i]
                                                .penilaian![p]
                                                .jenisNilai ==
                                            controller.pelaksanaanKKN[k])
                                          DataCell(Text(
                                              '${allNilai[i].penilaian![p].nilai}'))
                                  ])
                              ])),
                          _rowData('Laporan KKN', '',
                              const Color.fromARGB(255, 237, 237, 237),
                              isKategori: true),
                          SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: DataTable(columns: [
                                const DataColumn(
                                    label: SizedBox(
                                        width: 100, child: Text('Kategori'))),
                                for (int i = 0; i < allNilai.length; i++)
                                  DataColumn(
                                      label: Text(
                                          '${allNilai[i].penilaian![0].nim}'))
                              ], rows: [
                                for (int k = 0;
                                    k < controller.laporanKKN.length;
                                    k++)
                                  DataRow(cells: [
                                    DataCell(
                                        Text('${controller.laporanKKN[k]}')),
                                    for (int i = 0; i < allNilai.length; i++)
                                      for (int p = 0;
                                          p < allNilai[i].penilaian!.length;
                                          p++)
                                        if (allNilai[i]
                                                .penilaian![p]
                                                .jenisNilai ==
                                            controller.laporanKKN[k])
                                          DataCell(Text(
                                              '${allNilai[i].penilaian![p].nilai}'))
                                  ])
                              ])),
                        ],
                      ),
                    )
                  : const SizedBox())
          : const SizedBox();
    });
  }

  _dataMahasiswa() {
    return Container(
        decoration: BoxDecoration(
            color: bluedark,
            borderRadius: const BorderRadius.all(Radius.circular(5))),
        margin: const EdgeInsets.fromLTRB(0, 15, 0, 15),
        padding: const EdgeInsets.all(10),
        child: Obx(() {
          final mahasiswa = controller.mahasiswa.value;
          return controller.mahasiswa.value.nim != null
              ? Column(
                  children: [
                    _rowDataMahasiswa('Nama', mahasiswa.nama),
                    _rowDataMahasiswa('Nim', mahasiswa.nim),
                    _rowDataMahasiswa('No Telephone', mahasiswa.nomorTelephone),
                  ],
                )
              : const Center(
                  child: Text('Pilih mahasiswa dahulu',
                      style: const TextStyle(color: Colors.white)));
        }));
  }

  _cardPenilaian() {
    return Obx(() {
      final lengthPelKategori = controller.pelaksanaanKKN.length;
      final lengthLapKategori = controller.laporanKKN.length;
      return controller.pelaksanaanCtrl.length >= 0 ||
              controller.laporanCtrl.length >= 0
          ? Container(
              decoration: const BoxDecoration(
                  border: Border(
                      right: BorderSide(width: 0.2),
                      left: BorderSide(width: 0.2))),
              child: Column(children: [
                _rowData('AspekPenilaian', 'Nilai', bluedark),
                _rowData('Pelaksanaan KKN', 'Nilai',
                    const Color.fromARGB(255, 237, 237, 237),
                    isKategori: true),
                for (int i = 0; i < controller.pelaksanaanKKN.length; i++)
                  _rowDataInput(
                      '${controller.pelaksanaanKKN[i]}',
                      controller.pelaksanaanCtrl[i],
                      controller.pelaksanaanSuksesPost.isNotEmpty &&
                              controller.pelaksanaanSuksesPost.length >=
                                  lengthPelKategori
                          ? controller.pelaksanaanSuksesPost[i]
                          : null),
                _rowData('Laporan KKN', 'Nilai',
                    const Color.fromARGB(255, 237, 237, 237),
                    isKategori: true),
                for (int l = 0; l < controller.laporanKKN.length; l++)
                  _rowDataInput(
                      '${controller.laporanKKN[l]}',
                      controller.laporanCtrl[l],
                      controller.laporanSuksesPost.isNotEmpty &&
                              controller.laporanSuksesPost.length >=
                                  lengthLapKategori
                          ? controller.laporanSuksesPost[l]
                          : null),
                _rowData('', '', bluedark),
              ]),
            )
          : const SizedBox();
    });
  }

  _dropDownMenu() {
    return Obx(() {
      return Container(
        child: DropdownButton<String>(
            alignment: Alignment.bottomRight,
            underline: const SizedBox(),
            value: controller.dropDown.value,
            items: controller.anggota
                .map<DropdownMenuItem<String>>((dynamic value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
            onChanged: (String? newValue) {
              controller.clearAlert();

              controller.clearController();
              controller.dropDown.value = newValue!;

              controller.loadDataMahasiswa(newValue);
            },
            style: const TextStyle(
                fontSize: 12, color: Color.fromARGB(255, 21, 21, 21))),
      );
    });
  }

  _rowData(String txt1, String txt2, Color color,
      {bool isKategori = false, bool isHeader = false}) {
    return Container(
      padding: const EdgeInsets.fromLTRB(7, 12, 7, 12),
      decoration: BoxDecoration(
          color: color,
          borderRadius: isHeader
              ? const BorderRadius.only(
                  topLeft: Radius.circular(5), topRight: Radius.circular(5))
              : null),
      width: double.infinity,
      child: Row(children: [
        Expanded(
            child: Text(txt1,
                style: TextStyle(
                    color: isKategori ? Colors.black : Colors.white))),
        if (!isKategori)
          Expanded(
              child: Text(txt2, style: const TextStyle(color: Colors.white))),
      ]),
    );
  }

  btnViewKategoriNilai(
    String txt1,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(7, 12, 7, 12),
      decoration:
          const BoxDecoration(color: Color.fromARGB(255, 237, 237, 237)),
      child: Row(children: [
        Expanded(
            child: Text(txt1, style: const TextStyle(color: Colors.black))),
      ]),
    );
  }

  _rowDataMahasiswa(String label, dynamic value) {
    return Row(
      children: [
        SizedBox(
            width: 100,
            child: Text(label, style: const TextStyle(color: Colors.white))),
        const Text(': ', style: TextStyle(color: Colors.white)),
        Expanded(
            child: Text(value, style: const TextStyle(color: Colors.white)))
      ],
    );
  }

  _rowDataInput(String txt1, ctrl, value) {
    return Container(
      height: 45,
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(7, 12, 7, 12),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
                child: Text(
              txt1,
            )),
            Expanded(
              child: _textFormField(ctrl),
            ),
            value != null
                ? Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Center(
                            child: Text(value,
                                style: TextStyle(
                                    color: value == 'Berhasil'
                                        ? greenglo
                                        : redglobal)))))
                : const SizedBox()
          ]),
    );
  }

  _textFormField(ctrl) {
    return TextFormField(
      keyboardType: TextInputType.number,
      style: const TextStyle(fontSize: 12),
      controller: ctrl,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      decoration: const InputDecoration(),
      onChanged: (value) {
        ctrl.value = ctrl.value.copyWith(
          text: value,
          selection: TextSelection.collapsed(offset: value.length),
        );
        if (_validateInput(value) != null) {
          ctrl.text = value.substring(0, value.length - 1);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          return '';
        }
      },
    );
  }

  String? _validateInput(String value) {
    if (value.isEmpty) {
      return null;
    }
    final number = int.tryParse(value);
    if (number == null || number < 1 || number > 100) {
      return 'Please enter a number between 1 and 110';
    }
    return null;
  }

  _btnInsert() {
    return SizedBox(
      width: double.infinity,
      child: MaterialButton(
        color: bluedark,
        onPressed: () {
          controller.clearAlert();
          controller.pelaksanaanSuksesPost.clear();
          controller.laporanSuksesPost.clear();
          if (controller.formKey.currentState!.validate()) {
            for (int i = 0; i < controller.pelaksanaanKKN.length; i++) {
              final ctrl = controller.pelaksanaanCtrl[i].text;
              final kategori = controller.pelaksanaanKKN[i];
              var nim = controller.dropDown.value;
              PenilaianModel penilaian = PenilaianModel(
                  nim: nim, nilaiPost: ctrl, jenisNilai: kategori);
              controller.btnInsert(penilaian).then((value) {
                controller.pelaksanaanSuksesPost
                    .add(controller.messagePost.value);
              });
            }
            for (int i = 0; i < controller.laporanKKN.length; i++) {
              final ctrl = controller.laporanCtrl[i].text;
              final kategori = controller.laporanKKN[i];
              String nim = controller.dropDown.value;
              PenilaianModel penilaian = PenilaianModel(
                  nim: nim, nilaiPost: ctrl, jenisNilai: kategori);

              controller.btnInsert(penilaian).then((value) {
                controller.laporanSuksesPost.add(controller.messagePost.value);
              });
            }
          }
        },
        child: const Text('simpan', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

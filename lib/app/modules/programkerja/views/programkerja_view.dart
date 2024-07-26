import 'package:bebas/app/data/kelompokget_model.dart';
import 'package:bebas/app/data/programkerjapost.dart';
import 'package:bebas/app/modules/beranda/views/beranda_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/programkerja_controller.dart';

class ProgramkerjaView extends GetView<ProgramkerjaController> {
  const ProgramkerjaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var bluedark = const Color(0xff2b3f85);
    // var bluelight = const Color(0xff32529f);
    // var yellowglobal = const Color.fromRGBO(248, 171, 29, 1);
    // var redglobal = const Color(0xffea1e35);
    // var greenglo = const Color(0xff06880b);
    var mdSize = MediaQuery.of(context).size;
    KelompokGet kelompok = Get.arguments;
    controller.kelompok = kelompok;
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'Program kerja ',
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
      )),
      body: Container(
        padding: const EdgeInsets.all(10),
        height: mdSize.height,
        width: mdSize.width,
        color: const Color.fromARGB(255, 244, 244, 244),
        child: Column(
          children: [
            _formInput(),
            const Divider(),
            _dataKelompok(),
          ],
        ),
      ),
    );
  }

  _dataKelompok() {
    return Container(
      padding:const EdgeInsets.only(bottom: 40),
      child: Column(children: [
        Text(
          'Anggota kelompok',
          style: TextStyle(
              color: bluedark, fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 10,
        ),
        Obx(() {
          final anggotas = controller.allAnggota.value.mahasiswa;
          return anggotas != null
              ? Table(
                  border: TableBorder.all(width: 0.5, color: bluedark),
                  children: [
                    TableRow(children: [
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Container(
                          color: bluedark,
                          padding: const EdgeInsets.all(10),
                          child: const Text(
                            'Nama Mahasiswa',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Container(
                          color: bluedark,
                          padding: const EdgeInsets.all(10),
                          child: const Text(
                            'No Telepon',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ]),
                    for (int i = 0; i < anggotas.length; i++)
                      TableRow(children: [
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              '${anggotas[i].nama}',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              '${anggotas[i].nomorTelephone}',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ]),
                  ],
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        }),
      ]),
    );
  }

  _formInput() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
      child: Column(
        children: [
          Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(
                  width: 80,
                  child: Text('Judul'),
                ),
                Expanded(
                    child: _textInputField(
                  1,
                  controller.judulCtrl,
                ))
              ]),
          Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(
                  width: 80,
                  child: Text('Body'),
                ),
                Expanded(
                    child: _textInputField(
                  1,
                  controller.bodyCtrl,
                ))
              ]),
        ],
      ),
    );
  }

  _textInputField(
    int lines,
    ctrl,
  ) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isNotEmpty) {
          return 'Data tidak boleh kosong';
        } else {
          return null;
        }
      },
      decoration: const InputDecoration(),
      maxLines: lines,
      cursorHeight: 5.0,
      cursorWidth: 5.0,
      cursorRadius: const Radius.circular(50),
      controller: ctrl,
    );
  }

  _buttoninsert() {
    return Container(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          ProgramKerjaPost programkerja = ProgramKerjaPost(
              title: controller.judulCtrl.text, body: controller.bodyCtrl.text);
          controller.InsertProgramKerja(programkerja);
        },
        child: const Text('Simpan'),
      ),
    );
  }
}

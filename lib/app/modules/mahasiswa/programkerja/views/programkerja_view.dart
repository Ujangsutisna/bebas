// ignore_for_file: non_constant_identifier_names, use_super_parameters

import 'package:bebas/app/data/model/kelompokget_model.dart';
import 'package:bebas/app/data/model/programkerja_model.dart';
import 'package:bebas/app/data/model/programkerjapost.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../controllers/programkerja_controller.dart';

var bluedark = const Color(0xff2b3f85);
var bluelight = const Color(0xff32529f);
var yellowglobal = const Color.fromRGBO(248, 171, 29, 1);
var redglobal = const Color(0xffea1e35);
var greenglo = const Color(0xff06880b);

class ProgramkerjaView extends GetView<ProgramkerjaController> {
  const ProgramkerjaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.onReady();
    var mdSize = MediaQuery.of(context).size;
    KelompokGet kelompok = Get.arguments;
    controller.kelompok = kelompok;

    return Scaffold(
      floatingActionButton: Container(
        height: 60,
        margin: const EdgeInsets.only(left: 10),
        child: MaterialButton(
            onPressed: () {},
            child: Column(
              children: [
                Text('Informasi', style: TextStyle(color: redglobal)),
                Text(' ID GDrive', style: TextStyle(color: redglobal)),
                const Icon(Icons.arrow_drop_down)
              ],
            )),
      ),
      appBar: AppBar(
          title: const Text(
        'Program kerja ',
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
      )),
      body: Container(
        height: mdSize.height,
        width: mdSize.width,
        color: Colors.white,
        child: Column(children: [
          Container(
            color: Colors.white,
            child: Column(
              children: [
                _formInput(),
                const SizedBox(
                  height: 15,
                ),
                _buttoninsert()
              ],
            ),
          ),
          const SizedBox(height: 5),
          Obx(() {
            final currenStep = controller.currenStepPageview.value;
            return Container(
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(width: 0.5, color: bluedark),
                      bottom: BorderSide(width: 0.5, color: bluedark))),
              padding: const EdgeInsets.all(3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _btnPageView(currenStep, 0, 'Review'),
                  _btnPageView(currenStep, 1, 'Approve'),
                ],
              ),
            );
          }),
          Expanded(
            child: _PageViewProgramKerja(context, kelompok),
          ),
        ]),
      ),
    );
  }

  _btnPageView(currenStep, int index, String label) {
    return MaterialButton(
        onPressed: () {
          controller.btnChangeView(index);
        },
        child: Text(
          label,
          style: TextStyle(
              color: currenStep == index
                  ? bluedark
                  : const Color.fromARGB(255, 233, 232, 232)),
        ));
  }

  _PageViewProgramKerja(context, kelompok) {
    return Container(
      padding: const EdgeInsets.fromLTRB(17, 14, 17, 10),
      width: double.infinity,
      child: PageView(
          controller: controller.pageController,
          onPageChanged: (value) {
            controller.onChangedView(value);
          },
          children: [
            Obx(() {
              final prokerReview =
                  controller.allProkerReview.value.programKerja;

              return prokerReview != null
                  ? ListView(
                      children: [
                        for (int i = 0; i < prokerReview.length; i++)
                          _dataProkerView(prokerReview[i], i, context, kelompok,
                              isApprove: false)
                      ],
                    )
                  : const Center(child: Text('Data program kerja kosong'));
            }),
            Obx(() {
              final prokerApprove =
                  controller.allProkerApprove.value.programKerja;
              return prokerApprove != null
                  ? ListView(
                      children: [
                        for (int i = 0; i < prokerApprove.length; i++)
                          _dataProkerView(
                              prokerApprove[i], i, context, kelompok)
                      ],
                    )
                  : const Center(child: Text('Data program kerja kosong'));
            }),
          ]),
    );
  }

  _dataProkerView(ProgramKerjaGet proker, int index, BuildContext context,
      KelompokGet kelompok,
      {bool isApprove = true}) {
    return Obx(() {
      final id = proker.idProker;
      print(controller.indexdata.value);
      return Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 0.5, color: bluedark))),
        margin: const EdgeInsets.only(bottom: 10, top: 5),
        padding: const EdgeInsets.only(bottom: 5),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      color: bluedark,
                      borderRadius: const BorderRadius.all(Radius.circular(5))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${index + 1}',
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                      Text(
                        '${proker.approve}',
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w200,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 7),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${proker.judulProker}',
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 5),
                      Text('${proker.bodyProker}',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: bluedark)),
                      const SizedBox(height: 5),
                      SizedBox(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${proker.tanggalMulai}',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: bluedark)),
                            Text('${proker.tanggalSelesai }',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: bluedark)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              if (isApprove)
                MaterialButton(
                    onPressed: () {
                      var isDetailData = controller.detailData.value;
                      if (isDetailData == 1) {
                        controller.detailData.value = 0;
                      } else {
                        controller.detailData.value = 1;
                      }
                      controller.indexdata.value = index + 1;
                    },
                    child: AnimatedRotation(
                      turns: controller.detailData.value == 1 &&
                              index + 1 == controller.indexdata.value
                          ? 0.50
                          : 0,
                      duration: const Duration(milliseconds: 350),
                      curve: Curves.easeInOut,
                      child: Icon(
                        Icons.arrow_drop_down_rounded,
                        size: 30,
                        color: bluedark,
                      ),
                    )),
              MaterialButton(
                color: bluedark,
                onPressed: () {
                  final String pdfUrl =
                      'https://drive.google.com/uc?export=view&id=${proker.bodyProker}';
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: SfPdfViewer.network(pdfUrl),
                        );
                      });
                },
                child: const Text('Lihat PDF',
                    style: TextStyle(color: Colors.white)),
              )
            ]),
            if (isApprove)
              if (controller.detailData.value == 1 &&
                  index + 1 == controller.indexdata.value)
                Form(
                  key: controller.formKeyUpdate,
                  child: Column(
                    children: [
                      Row(children: [
                        Expanded(
                          child: _fieldInputDate(
                              context,
                              controller.tanggalMulaiCtrl,
                              'Tanggal mulai',
                              kelompok),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: _fieldInputDate(
                              context,
                              controller.tanggalSelesaiCtrl,
                              'Tanggal selesai',
                              kelompok),
                        )
                      ]),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              if (controller.formKeyUpdate.currentState!
                                  .validate()) {
                                print('view::${id}');
                                final idProker = id;
                                final tanggalMulai =
                                    controller.tanggalMulaiCtrl.text;
                                final tanggalSelesai =
                                    controller.tanggalSelesaiCtrl.text;
                                ProgramKerjaGet proker = ProgramKerjaGet(
                                    tanggalMulai: tanggalMulai,
                                    tanggalSelesai: tanggalSelesai);
                                controller.updateTanggalProker(
                                    idProker, proker);
                              }
                            },
                            child: const Text('Perbaharui',
                                style: TextStyle(color: Colors.white))),
                      )
                    ],
                  ),
                )
          ],
        ),
      );
    });
  }

  Widget _fieldInputDate(BuildContext context, TextEditingController ctrl,
      String label, KelompokGet kelompok) {
    return TextFormField(
      controller: ctrl,
      readOnly: true,
      decoration: InputDecoration(labelText: label),
      onTap: () async {
        DateTime firstDate = DateTime.parse('${kelompok.tanggalMulai}');
        DateTime lastDate = DateTime.parse('${kelompok.tanggalAkhir}');
        DateTime initialDate = controller.selectedDate.value;
        if (initialDate.isBefore(firstDate)) {
          initialDate =
              firstDate; // Ensure initialDate is on or after firstDate
        }
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: initialDate,
          firstDate: firstDate,
          lastDate: lastDate,
          onDatePickerModeChange: (mode) {
            if (mode == DatePickerEntryMode.input) {
              Get.back();
            }
          }, // Disable further switches

          switchToInputEntryModeIcon:
              const Icon(Icons.close, color: Colors.white), // Transparent icon
        );

        if (pickedDate != null) {
          controller.updateDate(pickedDate);
          String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
          ctrl.text = formattedDate;
        } else {}
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Data tidak boleh kosong';
        }
        return null;
      },
    );
  }

  _formInput() {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Form(
        key: controller.formKeyInsert,
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
                    child: Text('ID GDrive'),
                  ),
                  Expanded(
                      child: _textInputField(
                    1,
                    controller.bodyCtrl,
                  ))
                ]),
          ],
        ),
      ),
    );
  }

  _textInputField(
    int lines,
    ctrl,
  ) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Data tidak boleh kosong';
        } else {
          return null;
        }
      },
      decoration: const InputDecoration(),
      maxLines: lines,
      cursorHeight: 5.0,
      cursorWidth: 5.0,
      cursorRadius: const Radius.circular(60),
      controller: ctrl,
    );
  }

  _buttoninsert() {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      width: double.infinity,
      height: 40,
      child: ElevatedButton(
        onPressed: () {
          if (controller.formKeyInsert.currentState!.validate()) {
            ProgramKerjaPost programkerja = ProgramKerjaPost(
                title: controller.judulCtrl.text,
                body: controller.bodyCtrl.text);
            controller.InsertProgramKerja(programkerja);
          }
        },
        child: const Text('Simpan'),
      ),
    );
  }
}

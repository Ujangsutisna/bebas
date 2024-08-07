// ignore_for_file: non_constant_identifier_names, use_super_parameters

import 'package:bebas/app/data/model/sidang_model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/jadwalsidang_dospem_controller.dart';

var bluedark = const Color(0xff2b3f85);
var bluelight = const Color(0xff32529f);
var yellowglobal = const Color.fromRGBO(248, 171, 29, 1);
var redglobal = const Color(0xffea1e35);
var greenglo = const Color(0xff06880b);

class JadwalsidangDospemView extends GetView<JadwalsidangDospemController> {
  const JadwalsidangDospemView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('JadwalsidangDospemView'),
          centerTitle: true,
        ),
        body: Column(children: [
          _CardFormInput(context),
          Expanded(child: Obx(() {
            final sidang = controller.allSidang.value.sidangModel;
            if (sidang != null) {
              return Container(
                padding: const EdgeInsets.all(20),
                child: ListView(
                  children: [
                    for (int i = 0; i < sidang.length; i++)
                      _loadDataSidang(i, sidang[i]),
                  ],
                ),
              );
            } else {
              return const Center(
                child: Text('data kosong'),
              );
            }
          }))
        ]));
  }

  _CardFormInput(context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      decoration: const BoxDecoration(
          color: Colors.white, border: Border(bottom: BorderSide(width: 0.5))),
      child: Form(
        key: controller.formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _textInputField(1, controller.titleCtrl, 'Title'),
            const SizedBox(
              height: 10,
            ),
            _textInputField(1, controller.bodyCtrl, 'Body'),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            _fieldInputDate(
                context, controller.tanggalSidangCtrl, 'Tanggal sidang'),
            const SizedBox(
              height: 10,
            ),
            _buttoninsert(),
          ],
        ),
      ),
    );
  }

  Widget _fieldInputDate(
      BuildContext context, TextEditingController ctrl, String label) {
    return Row(
      children: [
        SizedBox(width: 80, child: Text(label)),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: TextFormField(
            controller: ctrl,
            readOnly: true,
            decoration: InputDecoration(labelText: label),
            onTap: () async {
              DateTime firstDate = DateTime(2000);
              DateTime lastDate = DateTime(2035);
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

                switchToInputEntryModeIcon: const Icon(Icons.close,
                    color: Colors.white), // Transparent icon
              );

              if (pickedDate != null) {
                controller.updateDate(pickedDate);
                String formattedDate =
                    DateFormat('yyyy-MM-dd').format(pickedDate);
                ctrl.text = formattedDate;
              } else {}
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Data tidak boleh kosong';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  _loadDataSidang(index, SidangModel sidang) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    color: greenglo,
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
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(width: 7),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${sidang.judulSidang}',
                  style:
                      TextStyle(fontWeight: FontWeight.w600, color: greenglo),
                ),
                const SizedBox(height: 5),
                Text('${sidang.body}',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    )),
                Text('${sidang.tanggalSidang}',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _textInputField(int lines, ctrl, String label) {
    return Row(
      children: [
        SizedBox(width: 80, child: Text(label)),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Data tidak boleh kosong';
              } else {
                return null;
              }
            },
            maxLines: lines,
            cursorHeight: 5.0,
            cursorWidth: 5.0,
            cursorRadius: const Radius.circular(50),
            controller: ctrl,
          ),
        ),
      ],
    );
  }

  _buttoninsert() {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: ElevatedButton(
        onPressed: () async {
          final title = controller.titleCtrl.text;
          final body = controller.bodyCtrl.text;
          final tanggal = controller.tanggalSidangCtrl.text;
          final idKelompok = controller.kelompok.idKelompok;
          SidangModel sidang = SidangModel(
              title: title,
              body: body,
              tanggalSidang: tanggal,
              idKelompok: idKelompok);
          controller.btnInput(sidang);
        },
        child: const Text('Simpan'),
      ),
    );
  }
}

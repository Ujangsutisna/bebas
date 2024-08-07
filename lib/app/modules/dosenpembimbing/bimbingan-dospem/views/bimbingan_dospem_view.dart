import 'package:bebas/app/data/model/bimbingan_model.dart';
import 'package:bebas/app/data/model/kelompokget_model.dart';
import 'package:bebas/app/modules/Login/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/bimbingan_dospem_controller.dart';

class BimbinganDospemView extends GetView<BimbinganDospemController> {
  const BimbinganDospemView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.onReady();
    final mdSize = MediaQuery.of(context).size;
    KelompokGet kelompok = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text('BimbinganDospemView'),
        centerTitle: true,
      ),
      body: Container(
        width: mdSize.width,
        height: mdSize.height,
        child: Column(children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border:
                    Border(bottom: BorderSide(width: 0.5, color: bluedark))),
            padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
            child: _formInput(kelompok, context),
          ),
          Expanded(
            child: Obx(() {
              final bimbingan = controller.allBimbingan.value.bimbinganModel;
              return bimbingan != null
                  ? Container(
                      padding: EdgeInsets.all(20),
                      child: ListView(
                        children: [
                          for (int i = 0; i < bimbingan.length; i++)
                            loadDataBimbingan(bimbingan[i], i)
                        ],
                      ),
                    )
                  : const Center(
                      child: Text('Bimbingan kosong'),
                    );
            }),
          )
        ]),
      ),
    );
  }

  _formInput(KelompokGet kelompok, context) {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          _textFieldInput('Judul Bimbingan', controller.titleCtrl),
          _textFieldInput('Body Bimbingan', controller.bodyCtrl, maxLines: 2),
          Row(
            children: [
              Expanded(child: _textFieldInput('Link', controller.linkCtrl)),
              const SizedBox(width: 10),
              Expanded(
                  child: _fieldInputDate(context, controller.tanggalCtrl,
                      'Tanggal bimbingan', kelompok)),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 40,
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  final title = controller.titleCtrl.text;
                  final body = controller.bodyCtrl.text;
                  final link = controller.linkCtrl.text;
                  final tanggal = controller.tanggalCtrl.text;
                  final idKelompok = controller.kelompok.idKelompok;
                  if (controller.formKey.currentState!.validate()) {
                    BimbinganModel bimbingan = BimbinganModel(
                        title: title,
                        body: body,
                        linkBimbingan: link,
                        tanggalBimbingan: tanggal,
                        idKelompok: idKelompok);
                    controller.insertBimbingan(bimbingan);
                  }
                },
                child: const Text('Simpan',
                    style: TextStyle(color: Colors.white))),
          )
        ],
      ),
    );
  }

  _textFieldInput(String label, ctrl, {int maxLines = 1}) {
    return TextFormField(
        maxLines: maxLines,
        controller: ctrl,
        decoration: InputDecoration(labelText: label),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Data tidak boleh kososng';
          } else {
            return null;
          }
        });
  }

  Widget _fieldInputDate(BuildContext context, TextEditingController ctrl,
      String label, KelompokGet kelompok) {
    return TextFormField(
      controller: ctrl,
      readOnly: true,
      decoration: InputDecoration(labelText: label),
      onTap: () async {
        DateTime firstDate = DateTime(2020);
        DateTime lastDate = DateTime(2035);
        DateTime initialDate = controller.selectedDate.value;
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

  loadDataBimbingan(BimbinganModel bimbingan, index) {
    return Container(
        decoration:
            const BoxDecoration(border: Border(bottom: BorderSide(width: 0.2))),
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Column(
          children: [
            _rowData('No', '${index + 1}'),
            _rowData('Judul', '${bimbingan.judul}'),
            _rowData('Isi', '${bimbingan.body}'),
            _rowData('link', '${bimbingan.linkBimbingan}'),
            _rowData('Tanggal', '${bimbingan.tanggalBimbingan}'),
          ],
        ));
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

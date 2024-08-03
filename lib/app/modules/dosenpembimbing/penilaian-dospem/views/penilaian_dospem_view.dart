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
    final ktgPelaksanaan = controller.pelaksanaanKKN;

    List<DataColumn> columns = [
      const DataColumn(
          label: Text('Kategori', style: const TextStyle(color: Colors.white))),
    ];
    List<DataRow> rows = [
      for (int i = 0; i < ktgPelaksanaan.length; i++)
        DataRow(cells: [
          DataCell(Text('${ktgPelaksanaan[i]}',
              style: const TextStyle(color: Colors.white)))
        ]),
    ];
    return Scaffold(
        appBar: AppBar(
          title: const Text('PenilaianDospemView',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: DataTable(
                      decoration: BoxDecoration(color: bluedark),
                      border: TableBorder.all(width: 0.1, color: Colors.white),
                      columns: columns,
                      rows: rows,
                    ),
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Obx(() {
                            final anggota = controller.anggota;
                            return controller.anggota.isNotEmpty
                                ? Form(
                                    key: controller.formKey,
                                    child: DataTable(
                                      border: TableBorder.all(width: 0.1),
                                      columns: [
                                        for (int i = 0; i < anggota.length; i++)
                                          DataColumn(
                                              label: Text('${anggota[i]}')),
                                      ],
                                      rows: [
                                        for (int a = 0;
                                            a < ktgPelaksanaan.length;
                                            a++)
                                          DataRow(cells: [
                                            for (int i = 0;
                                                i < anggota.length;
                                                i++)
                                              DataCell(a == 0
                                                  ? _textFormField(controller
                                                      .diSiplinCtrl[i])
                                                  : a == 1
                                                      ? _textFormField(controller
                                                          .kreativitasCtrl[i])
                                                      : a == 2
                                                          ? _textFormField(
                                                              controller
                                                                      .tanggungJawabCtrl[
                                                                  i])
                                                          : a == 3
                                                              ? _textFormField(
                                                                  controller
                                                                          .manfaatCtrl[
                                                                      i])
                                                              : a == 4
                                                                  ? _textFormField(
                                                                      controller
                                                                              .tataTulisCtrl[
                                                                          i])
                                                                  : _textFormField(
                                                                      controller
                                                                          .presentasiCtrl[i]))
                                          ]),
                                      ],
                                    ),
                                  )
                                : const SizedBox();
                          }))),
                ],
              ),
              _btnInsert(),
            ],
          ),
        ));
  }

  _textFormField(ctrl) {
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: ctrl,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      decoration: const InputDecoration(
        hintText: 'Nilai',
      ),
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
    return Container(
      width: double.infinity,
      child: MaterialButton(
        color: bluedark,
        onPressed: () {
          if (controller.formKey.currentState!.validate()) {}
        },
        child: Text('simpan', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

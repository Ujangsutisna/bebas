// ignore_for_file: non_constant_identifier_names, use_super_parameters, no_leading_underscores_for_local_identifiers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/daftarkkn_controller.dart';

// Text Editing Controller Ketua
final _Nimctrl = TextEditingController();
final _NamaLengkapctrl = TextEditingController();
final _Programstudictrl = TextEditingController();
final _Konsentrasictrl = TextEditingController();
final _TempatTglLahirctrl = TextEditingController();
final _Emailctrl = TextEditingController();
final _Telptrl = TextEditingController();
// Text Editing Controller Lokasi
final _Alamatctrl = TextEditingController();
final _Desactrl = TextEditingController();
final _Kelctrl = TextEditingController();
final _Kecctrl = TextEditingController();
final _KabKotactrl = TextEditingController();
final _Penanggungctrl = TextEditingController();
final _TelpPenanggungctrl = TextEditingController();

var bluedark = const Color(0xff2b3f85);
var bluelight = const Color(0xff32529f);
var yellowglobal = const Color.fromRGBO(248, 171, 29, 1);
var redglobal = const Color(0xffea1e35);

class DaftarkknView extends GetView<DaftarkknController> {
  const DaftarkknView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DaftarkknController());
    var mdsize = MediaQuery.of(context).size;
    var mdratiopixel = MediaQuery.of(context).devicePixelRatio;

    List<Step> _GetSteps() => [
          // Step 1 untuk data pribadi kkp dan ketua kelompok untuk kkn
          Step(
              isActive: controller.currentstep.value >= 0,
              title: const Text(''),
              content: SizedBox(
                child: Form(
                    key: controller.formkey[0],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                            child: Center(
                              child: Text(
                                'Data Pribadi',
                                style: TextStyle(
                                    fontSize: 9 * mdratiopixel,
                                    fontWeight: FontWeight.w600,
                                    color: bluedark),
                              ),
                            )),
                        Text(
                          '*Data pribadi akan di jadikan ketua kelompok KKN',
                          style: TextStyle(
                              fontSize: 5 * mdratiopixel,
                              fontWeight: FontWeight.w300,
                              color: redglobal),
                        ),
                        _fieldinput('Nim', _Nimctrl),
                        _fieldinput('Nama Lengkap', _NamaLengkapctrl),
                        _fieldinput('Program Studi', _Programstudictrl),
                        _fieldinput('Konsentrasi', _Konsentrasictrl),
                        _fieldinput(
                            'Tempat Dan Tanggal Lahir', _TempatTglLahirctrl),
                        _fieldinput('Email', _Emailctrl),
                        _fieldinput('Nomor Telepon', _Telptrl),
                        const SizedBox(
                          height: 6,
                        )
                      ],
                    )),
              )),
          Step(
              isActive: controller.currentstep.value >= 1,
              title: const Text(''),
              content: Form(
                key: controller.formkey[1],
                child: Column(
                  children: [
                    Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                        child: Center(
                          child: Text(
                            'Data anggota',
                            style: TextStyle(
                                fontSize: 9 * mdratiopixel,
                                fontWeight: FontWeight.w600,
                                color: bluedark),
                          ),
                        )),
                    SizedBox(
                      height: 20 * mdratiopixel,
                      child: ElevatedButton(
                          onPressed: () {
                            controller.NimAnggotactrl.length < 5
                                ? controller.addItem()
                                : Get.snackbar('Maaf', 'Maksimal Anggota KKN 5',
                                    colorText: Colors.white,
                                    backgroundColor: redglobal);
                          },
                          child: const Text('Tambah Anggota')),
                    ),
                    Obx(() => ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.NimAnggotactrl.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                                width: mdsize.width * 0.8,
                                margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: AnimatedContainer(
                                    duration: const Duration(seconds: 1),
                                    child: _fieldinputAnggota(
                                        'Nim Anggota ${index + 1}',
                                        controller.NimAnggotactrl[index],
                                        index)));
                          },
                        )),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
              )),
          Step(
              isActive: controller.currentstep.value >= 2,
              title: const Text(''),
              content: SizedBox(
                child: Form(
                    key: controller.formkey[2],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                            child: Center(
                              child: Text(
                                'Data lokasi KKN',
                                style: TextStyle(
                                    fontSize: 9 * mdratiopixel,
                                    fontWeight: FontWeight.w600,
                                    color: bluedark),
                              ),
                            )),
                        _fieldinput('Alamat', _Alamatctrl),
                        _fieldinput('Desa', _Desactrl),
                        _fieldinput('Kelurahan', _Kelctrl),
                        _fieldinput('Kecamatan', _Kecctrl),
                        _fieldinput('Kab / Kota', _KabKotactrl),
                        _fieldinput('Penangung Jawab', _Penanggungctrl),
                        _fieldinput('No Telp', _TelpPenanggungctrl),
                        const SizedBox(
                          height: 6,
                        )
                      ],
                    )),
              )),
          Step(
              isActive: controller.currentstep.value >= 3,
              title: const Text(''),
              content: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                      child: Center(
                        child: Text(
                          'Konfirmasi',
                          style: TextStyle(
                              fontSize: 9 * mdratiopixel,
                              fontWeight: FontWeight.w600,
                              color: bluedark),
                        ),
                      )),
                  Text(_Nimctrl.text),
                  Text(_NamaLengkapctrl.text),
                  Text(_Programstudictrl.text),
                  Text(_Telptrl.text),
                  Text(_Konsentrasictrl.text),
                  const SizedBox(height: 10)
                ],
              )),
        ];

    return Scaffold(
      body: SizedBox(
        width: mdsize.width,
        height: mdsize.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              width: mdsize.width,
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
              decoration: BoxDecoration(
                color: bluedark,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        CupertinoIcons.arrow_left,
                        color: Colors.white,
                        size: 30,
                      )),
                  const SizedBox(
                    width: 15,
                  ),
                  Text('Pendaftaran KKN',
                      style: TextStyle(
                          fontSize: 12 * mdratiopixel,
                          color: Colors.white,
                          fontWeight: FontWeight.w600))
                ],
              ),
            ),
            Expanded(
                child: SizedBox(
              width: mdsize.width,
              child: Obx(
                () => Stepper(
                  type: StepperType.horizontal,
                  steps: _GetSteps(),
                  currentStep: controller.currentstep.value,
                  onStepContinue: () {
                    controller.currentstep.value == _GetSteps().length - 1
                        // ignore: avoid_print
                        ? print('kirim data ke server api')
                        : controller.currentstep.value++;
                  },
                  onStepCancel: () {
                    controller.currentstep.value == 0
                        ? null
                        : controller.currentstep.value--;
                  },
                  controlsBuilder:
                      (BuildContext context, ControlsDetails details) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (controller.currentstep.value != 0)
                          Expanded(
                              child: SizedBox(
                            height: 23 * mdratiopixel,
                            child: ElevatedButton(
                              onPressed: details.onStepCancel,
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: redglobal),
                              child: const Text(
                                'Kembali',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )),
                        if (controller.currentstep.value != 0)
                          const SizedBox(width: 10),
                        Expanded(
                            child: SizedBox(
                          height: 23 * mdratiopixel,
                          child: ElevatedButton(
                              onPressed: details.onStepContinue,
                              child: Text(controller.currentstep.value ==
                                      _GetSteps().length - 1
                                  ? 'Simpan'
                                  : 'Lanjut')),
                        )),
                      ],
                    );
                  },
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }

  _fieldinput(String label, ctrl) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Data tidak boleh kosong';
          }
          return null;
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          labelText: label,
        ),
        controller: ctrl,
      ),
    );
  }

  _fieldinputAnggota(String label, ctrl, int index) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Data tidak boleh kosong';
        }
        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        suffixIcon: IconButton(
          onPressed: () {
            controller.removeItem(index);
          },
          icon: Icon(
            Icons.delete,
            color: redglobal,
          ),
        ),
        labelText: label,
      ),
      controller: ctrl,
    );
  }
}

// ignore_for_file: non_constant_identifier_names, use_super_parameters, no_leading_underscores_for_local_identifiers, avoid_unnecessary_containers, avoid_print, prefer_is_empty
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/daftarkkn_controller.dart';

var bluedark = const Color(0xff2b3f85);
var bluelight = const Color(0xff32529f);
var yellowglobal = const Color.fromRGBO(248, 171, 29, 1);
var redglobal = const Color(0xffea1e35);

// Text Editing Controller Lokasi

class DaftarkknView extends GetView<DaftarkknController> {
  const DaftarkknView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mdsize = MediaQuery.of(context).size;

    List<Step> _GetSteps() => [
          // Step 1 untuk data pribadi kkp dan ketua kelompok untuk kkn
          Step(
              state: controller.currentstep.value > 0
                  ? StepState.complete
                  : StepState.indexed,
              label: const Text('pribadi'),
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
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: bluedark),
                              ),
                            )),
                        Text(
                          '*Data pribadi akan di jadikan ketua kelompok KKN',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              color: redglobal),
                        ),
                        SizedBox(
                          height: mdsize.height * 0.5,
                          child: ListView(
                            children: [
                              _fieldinput('Nim', controller.NimKetuaCtrl.value,
                                  Icons.key,
                                  readonly: true),
                              _fieldinput(
                                  'Nama Lengkap',
                                  controller.NamaLengkapctrl.value,
                                  Icons.person_pin,
                                  readonly: true),
                              _fieldinput(
                                  'Program Studi',
                                  controller.Programstudictrl.value,
                                  Icons.book_rounded,
                                  readonly: true),
                              _fieldinput('Kelas', controller.Kelasctrl.value,
                                  Icons.class_,
                                  readonly: true),
                              _fieldinput(
                                  'Tanggal Lahir',
                                  controller.TglLahirctrl.value,
                                  Icons.date_range_rounded,
                                  readonly: true),
                              _fieldinput('Email', controller.Emailctrl.value,
                                  Icons.email,
                                  readonly: true),
                              _fieldinput('Nomor Telepon',
                                  controller.Telpctrl.value, Icons.phone,
                                  readonly: true),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        )
                      ],
                    )),
              )),
          Step(
              state: controller.currentstep.value > 1
                  ? StepState.complete
                  : StepState.indexed,
              label: const Text('anggota'),
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
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: bluedark),
                          ),
                        )),
                    SizedBox(
                      height: 30,
                      child: GestureDetector(
                          onTap: () {
                            controller.NimAnggotactrl.length < 4
                                ? controller.addItem()
                                : Get.snackbar('Maaf', 'Maksimal Anggota KKN 5',
                                    colorText: Colors.white,
                                    backgroundColor: redglobal);
                          },
                          child: const Row(
                            children: [
                              Icon(
                                Icons.add,
                                color: Colors.green,
                              ),
                              Text(
                                'Tambah Anggota',
                                style: TextStyle(color: Colors.green),
                              ),
                            ],
                          )),
                    ),
                    Container(
                      height: 365,
                      child: Obx(() => ListView.builder(
                            shrinkWrap: true,
                            itemCount: controller.NimAnggotactrl.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                  width: mdsize.width * 0.8,
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 15, 0, 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Input data anggota ${index + 1}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w800),
                                      ),
                                      _fieldinputAnggota(
                                          'Nim mahasiswa',
                                          controller.NimAnggotactrl[index],
                                          index,
                                          context),
                                      TextFormField(
                                        textCapitalization:
                                            TextCapitalization.sentences,
                                        readOnly: true,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Data tidak boleh kosong';
                                          }
                                          return null;
                                        },
                                        controller:
                                            controller.NamaAnggotactrl[index],
                                      )
                                    ],
                                  ));
                            },
                          )),
                    ),
                    const SizedBox(
                      height: 30,
                    )
                  ],
                ),
              )),
          Step(
              state: controller.currentstep.value > 2
                  ? StepState.complete
                  : StepState.indexed,
              label: const Text('Lokasi'),
              isActive: controller.currentstep.value >= 2,
              title: const Text(''),
              content: Column(
                children: [
                  Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                      child: Center(
                        child: Text(
                          'Data lokasi KKN',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: bluedark),
                        ),
                      )),
                  SizedBox(
                    height: 400,
                    child: Form(
                        key: controller.formkey[2],
                        child: ListView(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                    child: _fieldInputDate(
                                        context,
                                        controller.TanggalMulaictrl,
                                        'Tanggal Mulai')),
                                const SizedBox(width: 10),
                                Expanded(
                                    child: _fieldInputDate(
                                        context,
                                        controller.TanggalSelesaictrl,
                                        'Tanggal Selesai'))
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                Expanded(
                                  child: _fieldinput('Jalan',
                                      controller.Jalanctrl, Icons.location_on),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: _fieldinput('RT/RW',
                                      controller.RtRwctrl, Icons.location_on),
                                )
                              ],
                            ),
                            _fieldinput('Desa', controller.Desactrl,
                                Icons.location_searching),
                            _fieldinput('Kecamatan', controller.Kecctrl,
                                Icons.location_searching),
                            _fieldinput('Kab / Kota', controller.KabKotactrl,
                                Icons.location_city_rounded),
                            _fieldinput('Penangung Jawab',
                                controller.Penanggungctrl, Icons.person_pin),
                            _fieldinput('No Telp',
                                controller.TelpPenanggungctrl, Icons.phone),
                            const SizedBox(
                              height: 6,
                            )
                          ],
                        )),
                  ),
                ],
              )),
          Step(
              state: controller.currentstep.value > 3
                  ? StepState.complete
                  : StepState.indexed,
              label: const Text('Konfirmasi'),
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
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: bluedark),
                        ),
                      )),
                  const Text('Nama Ketua',
                      style: TextStyle(fontWeight: FontWeight.w600)),
                  Text(controller.NamaLengkapctrl.value.text),
                  const Divider(),
                  const Text('Nama anggota',
                      style: TextStyle(fontWeight: FontWeight.w600)),
                  Obx(() => controller.NimAnggotactrl.isNotEmpty
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (var i = 0;
                                i < controller.NimAnggotactrl.length;
                                i++)
                              Text(controller.NamaAnggotactrl[i].text),
                          ],
                        )
                      : const SizedBox()),
                  const Divider(),
                  const Text('Lokasi KKn',
                      style: TextStyle(fontWeight: FontWeight.w600)),
                  Text(
                    '${controller.Jalanctrl.value.text} ${controller.RtRwctrl.value.text} ${controller.Desactrl.value.text} ${controller.Kecctrl.value.text} ${controller.KabKotactrl.value.text}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                  const Divider(),
                  const Text('Penanggung jawab',
                      style: TextStyle(fontWeight: FontWeight.w600)),
                  Text(controller.Penanggungctrl.value.text),
                  const Divider(),
                  const Text('No Telp penanggung jawab',
                      style: TextStyle(fontWeight: FontWeight.w600)),
                  Text(controller.TelpPenanggungctrl.value.text),
                  const Divider(),
                  const SizedBox(height: 10),
                  Row(children: [
                    Obx(() {
                      return Checkbox(
                          activeColor: bluedark,
                          value: controller.isChecked.value,
                          onChanged: (bool? value) {
                            controller.isChecked.value = value!;
                          });
                    }),
                    const Expanded(
                        child: Text(
                      'Dengan ini saya menyatakan mengisi data dengan sebenar benarnya',
                      style: TextStyle(fontWeight: FontWeight.w400),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      softWrap: true,
                    ))
                  ]),
                  const SizedBox(height: 10),
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
              padding: const EdgeInsets.fromLTRB(10, 40, 20, 10),
              decoration: BoxDecoration(
                color: bluedark,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        Get.offNamed('beranda');
                      },
                      icon: const Icon(
                        CupertinoIcons.arrow_left,
                        color: Colors.white,
                        size: 20,
                      )),
                  const SizedBox(
                    width: 15,
                  ),
                  const Text('Pendaftaran KKN',
                      style: TextStyle(
                          fontSize: 19,
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
                  connectorThickness: 0,
                  type: StepperType.horizontal,
                  steps: _GetSteps(),
                  currentStep: controller.currentstep.value,
                  onStepContinue: () {
                    final ValueStep = controller.currentstep.value;
                    final AnggotaEmpty = controller.NimAnggotactrl.isEmpty;
                    final isChecked = controller.isChecked.value;
                    ValueStep == _GetSteps().length - 1
                        ? isChecked
                            ? controller.PostServer()
                            : Get.snackbar(
                                'Maaf', 'Mohon Ceklis terlebih dahulu',
                                colorText: Colors.white,
                                backgroundColor: redglobal)
                        : controller.formkey[ValueStep].currentState!.validate()
                            ? ValueStep != 1
                                ? controller.currentstep.value++
                                : AnggotaEmpty
                                    ? Get.snackbar('Maaf',
                                        'Anda harus menambahkan anggota',
                                        backgroundColor: redglobal,
                                        colorText: Colors.white)
                                    : controller.currentstep.value++
                            : null;
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
                            height: 43,
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
                          height: 43,
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

  _fieldinput(
    String label,
    ctrl,
    IconData icon, {
    bool readonly = false,
    bool border = true,
  }) {
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
          border: border
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                )
              : null,
          hintText: label,
        ),
        controller: ctrl,
        readOnly: readonly,
        cursorHeight: 5.0,
        cursorWidth: 5.0,
        cursorRadius: const Radius.circular(50),
      ),
    );
  }

  Widget _fieldInputDate(
      BuildContext context, TextEditingController ctrl, String label) {
    return TextFormField(
      controller: ctrl,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label,
      ),
      readOnly: true,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: controller.selectedDate.value,
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
        );

        if (pickedDate != null) {
          controller.updateDate(pickedDate);
          String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
          ctrl.text = formattedDate;
        } else {
          print("Date is not selected");
        }
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Data tidak boleh kosong';
        }
        return null;
      },
    );
  }

  _fieldinputAnggota(String label, ctrl, int index, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w400),
            )),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextFormField(
            keyboardType: TextInputType.number,
            onChanged: (value) async {
              print("status :: ${controller.isCheckedNim.value}");
              await controller.getMahasiswaByID(value).then((isTrue) async {
                //cek tabel kelompok dengan reject

                bool isDuplicate = false;
                //cek duplikate data
                for (var i = 0; i < controller.NimAnggotactrl.length; i++) {
                  if (index != i &&
                      value == controller.NimAnggotactrl[i].text) {
                    print(i);
                    isDuplicate = true;
                    break;
                  }
                }
                final dataMhs = controller.mahasiswa.value;

                if (value == controller.NimKetuaCtrl.value.text) {
                  controller.NimAnggotactrl[index].text = '';
                  controller.isCheckedNim.value = false;
                  Get.snackbar('Maaf', 'Data ketua tidak perlu diinput ulang',
                      backgroundColor: redglobal, colorText: Colors.white);
                } else if (isDuplicate) {
                  controller.isCheckedNim.value = false;
                  Get.snackbar('Maaf', 'NIM sama dengan anggota lainnya',
                      backgroundColor: redglobal, colorText: Colors.white);
                } else if (isTrue == false) {
                  controller.isCheckedNim.value = false;
                } else {
                  controller.isCheckedNim.value = true;
                }
                if (isTrue) {
                  FocusScope.of(context).unfocus();
                  if (controller.isCheckedNim.value) {
                    controller.NamaAnggotactrl[index].text = dataMhs.nama!;

                    showModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(10))),
                      context: context,
                      builder: (BuildContext context) => Container(
                        height: 230,
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(20),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: bluedark,
                                  borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(10))),
                              child: const Center(
                                child: Text('Nama Mahasiswa',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600)),
                              ),
                            ),
                            Container(
                                padding:
                                    const EdgeInsets.fromLTRB(30, 0, 20, 20),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    _rowData('Nama', dataMhs.nama),
                                    _rowData('Prodi', dataMhs.prodi!.namaProdi),
                                    _rowData('Kelas', dataMhs.kelas!.namaKelas),
                                    _rowData('Email', dataMhs.user!.email),
                                    _rowData('Telepon', dataMhs.nomorTelephone)
                                  ],
                                )),
                          ],
                        ),
                      ),
                    );
                  }
                } else {
                  controller.NamaAnggotactrl[index].text = '';
                }
              });
            },
            style: const TextStyle(fontSize: 14),
            decoration: InputDecoration(
              suffixIcon: IconButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    Get.defaultDialog(
                        title: 'Hapus anggota',
                        middleText: 'Apakan anda yakin untuk hapus',
                        confirm: MaterialButton(
                            color: redglobal,
                            onPressed: () {
                              controller.removeItem(index);
                              Get.back();
                            },
                            child: const Text('Iya',
                                style: TextStyle(color: Colors.white))),
                        cancel: MaterialButton(
                            color: bluedark,
                            onPressed: () {
                              Get.back();
                            },
                            child: const Text('Tidak',
                                style: TextStyle(color: Colors.white))));
                  },
                  icon: Icon(
                    Icons.delete,
                    color: redglobal,
                    size: 20,
                  )),
            ),
            controller: ctrl,
            cursorHeight: 5.0,
            cursorWidth: 5.0,
            cursorRadius: const Radius.circular(50),
          ),
        ),
      ],
    );
  }

  _rowData(String? nama, dataMhs) {
    return Container(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 80,
            child: Text(
              '$nama',
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
          const Text(':  '),
          Expanded(
            child: Text(
              dataMhs,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}

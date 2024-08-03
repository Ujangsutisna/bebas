import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../controllers/laporan_controller.dart';

var bluedark = const Color(0xff2b3f85);
var bluelight = const Color(0xff32529f);
var yellowglobal = const Color.fromRGBO(248, 171, 29, 1);
var redglobal = const Color(0xffea1e35);
var greenglo = const Color(0xff06880b);

class LaporanView extends GetView<LaporanController> {
  const LaporanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Laporan',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
      ),
      body: Container(
        color: const Color.fromARGB(255, 242, 242, 242),
        child: Column(
          children: [
            CardFormInput(),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Obx(() {
                  final laporan = controller.allLaporan.value.laporan;
                  if (controller.allLaporan.value.laporan != null) {
                    return ListView(
                      children: [
                        for (int i = 0; i < laporan!.length; i++)
                          Container(
                            margin: const EdgeInsets.only(
                              bottom: 10,
                            ),
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            child: Row(children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    color: greenglo,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(5))),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${i + 1}',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      '${laporan[i].approve}',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('${laporan[i].judulLaporan}'),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text('${laporan[i].bodyLaporan}')
                                  ],
                                ),
                              ),
                              MaterialButton(
                                  onPressed: () {
                                    final fileName = laporan[i].fileLaporan;
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return SfPdfViewer.network(
                                              'https://kkn.proyek.org/storage/$fileName');
                                        });
                                  },
                                  child: Row(
                                    children: [
                                      Icon(Icons.remove_red_eye,
                                          color: greenglo),
                                      const SizedBox(
                                        width: 2,
                                      ),
                                      Text("pdf",
                                          style: TextStyle(color: greenglo))
                                    ],
                                  ))
                            ]),
                          ),
                      ],
                    );
                  } else if (!controller.isdatalaporan.value) {
                    return Center(child: Text('Anda belum simpan laporan'));
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }

  CardFormInput() {
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
            Row(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles(
                      type: FileType.custom,
                      allowedExtensions: ['pdf', 'doc', 'docx'],
                    );

                    if (result != null) {
                      controller.selectedFile = File(result.files.single.path!);
                      controller.fileName.value = result.files.single.name;
                    }
                  },
                  child: const Text('Select File'),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Obx(() => Center(
                        child: Text(
                          controller.fileName.value.isNotEmpty
                              ? 'Selected File: ${controller.fileName.value}'
                              : 'No file selected',
                          style: const TextStyle(color: Colors.grey),
                        ),
                      )),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            _buttoninsert(),
          ],
        ),
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
          if (controller.formkey.currentState!.validate()) {
            await controller.inputLaporan(controller.titleCtrl.text,
                controller.bodyCtrl.text, controller.selectedFile);
          }
        },
        child: const Text('Simpan'),
      ),
    );
  }
}

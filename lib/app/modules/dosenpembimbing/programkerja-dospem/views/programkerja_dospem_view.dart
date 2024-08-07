import 'package:bebas/app/data/model/kelompokget_model.dart';
import 'package:bebas/app/data/model/programkerja_model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../controllers/programkerja_dospem_controller.dart';

var bluedark = const Color(0xff2b3f85);
var bluelight = const Color(0xff32529f);
var yellowglobal = const Color.fromRGBO(248, 171, 29, 1);
var redglobal = const Color(0xffea1e35);
var greenglo = const Color(0xff06880b);

class ProgramkerjaDospemView extends GetView<ProgramkerjaDospemController> {
  const ProgramkerjaDospemView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.onReady();
    var mdSize = MediaQuery.of(context).size;

    return Scaffold(
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
          Obx(() {
            final currenStep = controller.currenStepPageview.value;
            return Container(
              decoration: BoxDecoration(
                  border:
                      Border(bottom: BorderSide(width: 0.5, color: bluedark))),
              padding: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _btnPageView(currenStep, 0, 'Review'),
                  _btnPageView(currenStep, 1, 'Approve'),
                  _btnPageView(currenStep, 2, 'Reject'),
                ],
              ),
            );
          }),
          Expanded(
            child: _dataProgramKerja(context),
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

  _dataProgramKerja(context) {
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

              return controller.allProkerReview.value.programKerja != null
                  ? ListView(
                      children: [
                        for (int i = 0;
                            i <
                                controller
                                    .allProkerReview.value.programKerja!.length;
                            i++)
                          _dataProkerview(prokerReview![i], i, context)
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
                          _dataProkerview(prokerApprove[i], i, context,
                              review: false)
                      ],
                    )
                  : const Center(child: Text('Data program kerja kosong'));
            }),
            Obx(() {
              final prokerApprove =
                  controller.allProkerReject.value.programKerja;

              return prokerApprove != null
                  ? ListView(
                      children: [
                        for (int i = 0; i < prokerApprove.length; i++)
                          _dataProkerview(prokerApprove[i], i, context,
                              review: false)
                      ],
                    )
                  : const Center(child: Text('Data program kerja kosong'));
            }),
          ]),
    );
  }

  _dataProkerview(ProgramKerjaGet proker, int index, BuildContext context,
      {bool review = true}) {
    return Obx(() {
      return AnimatedContainer(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 0.5, color: bluedark))),
        margin: const EdgeInsets.only(bottom: 10, top: 5),
        padding: const EdgeInsets.only(bottom: 5),
        duration: const Duration(seconds: 2),
        curve: Curves.easeInOut,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          color:
                              proker.approve == 'reject' ? redglobal : greenglo,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5))),
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
                    const SizedBox(height: 5),
                    SizedBox(
                      height: 30,
                      width: 60,
                      child: MaterialButton(
                          color:
                              proker.approve == 'reject' ? redglobal : greenglo,
                          onPressed: () {
                            final String pdfUrl =
                                'https://drive.google.com/uc?export=view&id=${proker.bodyProker}';
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    child: SfPdfViewer.network(pdfUrl),
                                  );
                                });
                          },
                          child: const Text('PDF',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 12))),
                    ),
                  ],
                ),
                const SizedBox(width: 7),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${proker.judulProker}',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: proker.approve == 'reject'
                                ? redglobal
                                : greenglo,
                            fontSize: 16),
                      ),
                      const SizedBox(height: 5),
                      Text('${proker.bodyProker}',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          )),
                      const SizedBox(height: 5),
                      _rowData(
                          'Mulai', proker.tanggalMulai ?? 'Tanggal Kosong'),
                      const SizedBox(height: 5),
                      _rowData(
                          'Selesai', proker.tanggalMulai ?? 'Tanggal Kosong'),
                    ],
                  ),
                ),
              ],
            ),
            if (review)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AnimatedRotation(
                    turns: controller.updateProker.value == 1 &&
                            index + 1 == controller.indexBtn.value
                        ? 0.50
                        : 0, // 0.25 turns equal to 90 degrees (right to up)
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                    child: MaterialButton(
                        onPressed: () {
                          if (controller.updateProker.value == 0) {
                            controller.updateProker.value = 1;
                            controller.indexBtn.value = index + 1;
                          } else {
                            controller.updateProker.value = 0;
                            controller.indexBtn.value = index;
                          }
                        },
                        child: Icon(Icons.arrow_drop_down_sharp,
                            size: 30, color: bluedark)),
                  ),
                ],
              ),
            controller.updateProker.value == 1 &&
                    index + 1 == controller.indexBtn.value
                ? Column(children: [
                    _DropdownList(),
                    const SizedBox(height: 5),
                    _btnUpdateStatus(proker.idProker)
                  ])
                : const SizedBox(),
          ],
        ),
      );
    });
  }

  _DropdownList() {
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Perbaharui status program kerja',
            style: TextStyle(
                color: bluedark, fontWeight: FontWeight.w500, fontSize: 12),
          ),
          const SizedBox(width: 50),
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

  _btnUpdateStatus(idProker) {
    return SizedBox(
        height: 40,
        width: double.infinity,
        child: MaterialButton(
            color: greenglo,
            onPressed: () {
              final id = idProker;
              final ProgramKerjaGet proker =
                  ProgramKerjaGet(approve: controller.Dropdownvalue.value);
              controller.insertUpdateStatus(id, proker);
            },
            child:
                const Text('Simpan', style: TextStyle(color: Colors.white))));
  }

  _rowData(String label, value) {
    return Row(
      children: [
        SizedBox(
          width: 80,
          child: Text(label),
        ),
        const Text(': '),
        Expanded(child: Text(value))
      ],
    );
  }
}

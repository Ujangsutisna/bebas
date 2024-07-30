import 'package:bebas/app/data/model/kelompokget_model.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/review_controller.dart';

class ReviewView extends GetView<ReviewController> {
  const ReviewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final KelompokGet kelompok = Get.arguments;
    controller.kelompok = kelompok;
    final mdsize = MediaQuery.of(context).size;
    var bluedark = const Color(0xff2b3f85);
    var bluelight = const Color(0xff32529f);
    var yellowglobal = const Color.fromRGBO(248, 171, 29, 1);
    var redglobal = const Color(0xffea1e35);
    var greenglo = const Color(0xff06880b);

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [Color(0xff3f5efb), Color(0xff2e4a94)],
          stops: [0.2, 0.7],
          begin: Alignment(-0.0, 1.0),
          end: Alignment(-0.0, -0.9),
        )),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/${kelompok.approve}.png',
                  height: mdsize.height * 0.4, fit: BoxFit.cover),
              const SizedBox(height: 10),
              Text(
                'Pendaftaran Anda di ${kelompok.approve}',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w800),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text(
                        'Kembali',
                        style: TextStyle(
                            color: Color.fromARGB(255, 206, 233, 255),
                            fontSize: 14,
                            fontWeight: FontWeight.w200),
                      )),
                  if (kelompok.approve == 'approve') const SizedBox(width: 10),
                  if (kelompok.approve == 'approve')
                    TextButton(
                        onPressed: () {
                          Get.toNamed('programkerja', arguments: kelompok);
                        },
                        child: const Text(
                          'Program Kerja',
                          style: TextStyle(
                              color: Color.fromARGB(255, 206, 233, 255),
                              fontSize: 14,
                              fontWeight: FontWeight.w200),
                        )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

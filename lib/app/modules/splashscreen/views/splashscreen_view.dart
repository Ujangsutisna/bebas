import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splashscreen_controller.dart';

var bluedark = const Color(0xff2b3f85);

class SplashscreenView extends GetView<SplashscreenController> {
  const SplashscreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.onInit();
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 80),
        decoration: BoxDecoration(color: bluedark),
        child: Column(children: [
          Expanded(
              child: Container(
            padding: const EdgeInsets.only(top: 150),
            height: MediaQuery.of(context).size.height * 0.6,
            child:  const Text(
              'K2NGlobal Institute',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w900),
            ),
          )),
          Image.asset('assets/images/Logo1.png',
              height: MediaQuery.of(context).size.height * 0.2,
              fit: BoxFit.cover),
        ]),
      ),
    );
  }
}

// ignore_for_file: non_constant_identifier_names, use_super_parameters

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/ganti_password_controller.dart';

final _Passwordformkey = GlobalKey<FormState>();
final email = TextEditingController();

class GantiPasswordView extends GetView<GantiPasswordController> {
  const GantiPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Size mediaquerysize = MediaQuery.of(context).size;
    final double mediaquerypixel = MediaQuery.of(context).devicePixelRatio;
    var bluedark = const Color(0xff2b3f85);
    var bluelight = const Color(0xff32529f);
    // var yellowglobal = const Color(0xfff8ab1d);
    // var redglobal = const Color(0xffea1e35);
    return Scaffold(
      body: Container(
        width: mediaquerysize.width,
        height: mediaquerysize.height,
        decoration: BoxDecoration(color: bluedark),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
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
                      Text('Lupa Password',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12 * mediaquerypixel,
                              color: Colors.white))
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Image.asset(
                      'assets/images/Logo1.png',
                      width: mediaquerysize.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              width: mediaquerysize.width,
              height: mediaquerysize.height * 0.7,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0))),
              child: Form(
                  key: _Passwordformkey,
                  child: Column(
                    children: [
                      Text(' Lupa Password ?',
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 10 * mediaquerypixel,
                              color: bluedark)),
                      const SizedBox(
                        height: 10,
                      ),
                      _TextFormField(),
                      _Button(mediaquerysize.width, bluelight),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }

  _TextFormField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: TextFormField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Masukan Email Terdaftar',
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Data tidak boleh kosong';
          }
          return null;
        },
        controller: email,
      ),
    );
  }

  _Button(double width, Color color) {
    return SizedBox(
        width: width,
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            if (_Passwordformkey.currentState!.validate()) {
              Get.toNamed('verif-o-t-p');
              Get.snackbar(
                  'Berhasil', 'Silahkan Lihat OTP yang kami kirim via email',
                  colorText: Colors.white);
            } else {
              Get.snackbar('Gagal', 'Email anda salah atau belum terdaftar',
                  colorText: Colors.white);
            }
          },
          style: ElevatedButton.styleFrom(backgroundColor: color),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [Text('Kirim kode OTP'), Icon(Icons.chevron_right)],
          ),
        ));
  }


}

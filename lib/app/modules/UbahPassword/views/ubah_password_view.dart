// ignore_for_file: non_constant_identifier_names, use_super_parameters

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/ubah_password_controller.dart';

final Password1 = TextEditingController();
final Password2 = TextEditingController();
var bluedark = const Color(0xff2b3f85);
var bluelight = const Color(0xff32529f);
// var yellowglobal = const Color(0xfff8ab1d);
var redglobal = const Color(0xffea1e35);
var greenglo = const Color(0xff06880b);

class UbahPasswordView extends GetView<UbahPasswordController> {
  const UbahPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Size mediaquerysize = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        // Kembalikan false untuk mencegah tombol "Back" berfungsi
        return false;
      },
      child: Scaffold(
        body: Theme(
          data: ThemeData(colorScheme: ColorScheme.light(primary: bluedark)),
          child: Container(
            width: mediaquerysize.width,
            height: mediaquerysize.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                bluelight,
                bluedark,
              ],
            )),
            child: ListView(
              children: [
                Container(
                  height: mediaquerysize.height * 0.4,
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        child: Image.asset('assets/images/Logo1.png',
                            height: mediaquerysize.height * 0.2,
                            fit: BoxFit.cover),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: mediaquerysize.height * 0.6,
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0)),
                  ),
                  child: Form(
                    key: controller.formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Column(
                              children: [
                                Text('Ubah password',
                                    style: TextStyle(
                                        color: bluedark,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w800)),
                                Text('Masukan password baru',
                                    style: TextStyle(
                                        color: bluedark,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400))
                              ],
                            )),
                        const Divider(),
                        const SizedBox(height: 10),
                        _FielInput('Password', Password1),
                        _FielInput('Ulang Password', Password2),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              if (controller.formkey.currentState!.validate()) {
                                if (Password1.text == Password2.text) {
                                  Get.offAllNamed('login');
                                  Get.snackbar(
                                      'Berhasil', 'Password berhasil di ubah',
                                      backgroundColor: greenglo,
                                      colorText: Colors.white);
                                } else {
                                  Get.snackbar(
                                      'Upsss', 'Password anda tidak sama',
                                      colorText: Colors.white);
                                }
                              } else {}
                            },
                            child: const Text("Simpan"),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _FielInput(String Label, ctrl) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10,
      ),
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: Label,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Data tidak boleh kosong';
          }
          return null;
        },
        controller: ctrl,
        cursorHeight: 5.0,
        cursorWidth: 5.0,
        cursorRadius: const Radius.circular(50),
      ),
    );
  }
}

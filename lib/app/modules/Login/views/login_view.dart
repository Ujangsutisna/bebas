import 'package:bebas/app/modules/beranda/views/beranda_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

final _NimCtrl = TextEditingController();

final _PasswordCtrl = TextEditingController();
var bluedark = const Color(0xff2b3f85);

// ignore: non_constant_identifier_names
class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String typeAccount = 'mahasiswa';
    final Size mediaquerysize = MediaQuery.of(context).size;
    final loginController = Get.put(LoginController());

    var bluelight = const Color(0xff32529f);
    // var yellowglobal = const Color(0xfff8ab1d);
    var redglobal = const Color(0xffea1e35);
    return Scaffold(
      body: Container(
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
                        height: mediaquerysize.height * 0.2, fit: BoxFit.cover),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    width: double.infinity,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Selamat Datang',
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 30,
                                color: Colors.white)),
                        Text('Aplikasi Pendaftaran KKN UGM',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Colors.white)),
                      ],
                    ),
                  )
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
                key: loginController.loginformKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Column(
                          children: [
                            Text('Login',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22,
                                    color: bluedark)),
                            Text('Masukan Nim Dan Password',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: bluedark))
                          ],
                        )),
                    const Divider(),
                    const SizedBox(height: 10),
                    _FielInput('Nim /NID', _NimCtrl, Icons.person_pin),
                    _FielInput(
                        'Password', _PasswordCtrl, Icons.password_outlined,
                        obSecure: true),
                    _DropdownList(typeAccount),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (controller.loginformKey.currentState!
                              .validate()) {
                            final Nim = _NimCtrl.text;
                            final password = _PasswordCtrl.text;

                            await controller.LoginService(Nim, password)
                                .then((value) {
                              if (value) {
                                Get.snackbar('Selamat Datang', 'Login berhasil',
                                    overlayBlur: 0.9,
                                    backgroundColor: greenglo,
                                    colorText: Colors.white);
                                Get.offNamed('beranda');
                               
                           
                              } else {
                                Get.snackbar(
                                    'Maaf', controller.messageEror.value,
                                    overlayBlur: 0.9,
                                    backgroundColor: redglobal,
                                    colorText: Colors.white);
                              }
                            });
                          }
                        },
                        child: const Text("Simpan"),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Get.toNamed('ganti-password');
                        },
                        child: const Text('Lupa Password ?',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Colors.blue)))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _FielInput(String Label, ctrl, IconData icon, {bool obSecure = false}) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10,
      ),
      child: TextFormField(
        obscureText: obSecure,
        cursorHeight: 5.0,
        cursorWidth: 5.0,
        cursorRadius: const Radius.circular(50),
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          prefixIconColor: bluedark,
          labelText: Label,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Data tidak boleh kosong';
          }
          return null;
        },
        controller: ctrl,
      ),
    );
  }

  _DropdownList(typeAccount) {
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Tipe Akun Login',
            style: TextStyle(
                color: bluedark, fontWeight: FontWeight.w500, fontSize: 12),
          ),
          const SizedBox(width: 50),
          DropdownButton<String>(
              alignment: Alignment.bottomRight,
              underline: const SizedBox(),
              value: controller.Dropdownvalue.value,
              items: <String>['mahasiswa', 'dosen_pembimbing']
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
}

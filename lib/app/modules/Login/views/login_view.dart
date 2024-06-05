import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import '../controllers/login_controller.dart';

final formKey = GlobalKey<FormState>();
final Username = TextEditingController();
final Password = TextEditingController();

// ignore: non_constant_identifier_names
class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size mediaquerysize = MediaQuery.of(context).size;
    final double mediaquerypixel = MediaQuery.of(context).devicePixelRatio;

    var bluedark = const Color(0xff2b3f85);
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _Text('Selamat Datang', FontWeight.w800,
                            20 * mediaquerypixel, Colors.white),
                        _Text('Aplikasi Pendaftaran KKN UGM', FontWeight.w400,
                            9 * mediaquerypixel, Colors.white),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: mediaquerysize.height*0.6,
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0)),
              ),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Column(
                          children: [
                            _Text('LOGIN', FontWeight.w800,
                                14 * mediaquerypixel, bluedark),
                            _Text('Masukan Username Dan Password',
                                FontWeight.w400, 9 * mediaquerypixel, bluedark)
                          ],
                        )),
                        Divider(),
                        SizedBox(height:10),
                    _FielInput('Username', Username),
                    _FielInput('Password', Password),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  backgroundColor: Colors.green,
                                  content: Center(
                                    child: Row(
                                      children: [
                                        Text("Login Berhasil"),
                                        SizedBox(width: 5),
                                      ],
                                    ),
                                  )),
                            );
                            Get.toNamed('beranda');
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  backgroundColor: redglobal,
                                  content: const Center(
                                    child: Row(
                                      children: [
                                        Text(
                                          "Username dan Password salah ",
                                        ),
                                        SizedBox(width: 5),
                                      ],
                                    ),
                                  )),
                            );
                          }
                        },
                        child: const Text("Simpan"),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: bluelight),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Get.toNamed('ganti-password');
                          Get.snackbar(
                              'Alert', 'Waktunya ganti password sayang',
                              backgroundColor: redglobal,
                              colorText: Colors.white);
                        },
                        child: _Text('Lupa Password ?', FontWeight.w400,
                            9 * mediaquerypixel,Colors.blue))
                  ],
                ),
              ),
            )
          ],
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
      ),
    );
  }

  _Text(String tittle, FontWeight fontweight, double size, Color color) {
    return Text(
      tittle,
      style: GoogleFonts.getFont(
        'Alumni Sans',
        fontWeight: fontweight,
        fontSize: size,
        color: color,
      ),
    );
  }
}

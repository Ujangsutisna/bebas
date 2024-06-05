import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/ganti_password_controller.dart';

final _formkey = GlobalKey<FormState>();
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
              height: mediaquerysize.height * 0.4,
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
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
              height: mediaquerysize.height * 0.6,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0))),
              child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      _Text(' Lupa Password ?', FontWeight.w800,
                          14 * mediaquerypixel, bluedark),
                      _Text('Masukan email yang terdaftrar :', FontWeight.w400,
                          9 * mediaquerypixel, bluedark),
                      SizedBox(
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
            if (_formkey.currentState!.validate()) {
              Get.toNamed('verif-o-t-p');
              Get.snackbar(
                  'Berhasil', 'Silahkan Lihat OTP yang kami kirim via email',
                  colorText: Colors.white);
            } else {
              Get.snackbar('Gagal', 'Email anda salah atau belum terdaftar',
                  colorText: Colors.white);
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [const Text('Kirim kode OTP'), Icon(Icons.chevron_right)],
          ),
          style: ElevatedButton.styleFrom(backgroundColor: color),
        ));
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

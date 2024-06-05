import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/verif_o_t_p_controller.dart';

final _formkey = GlobalKey<FormState>();
final email = TextEditingController();

class VerifOTPView extends GetView<VerifOTPController> {
  const VerifOTPView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Size mediaquerysize = MediaQuery.of(context).size;
    final double mediaquerypixel = MediaQuery.of(context).devicePixelRatio;
    var bluedark = const Color(0xff2b3f85);
    // var bluelight = const Color(0xff32529f);
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
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
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
                      _Text(' Verifikasi OTP ?', FontWeight.w800,
                          14 * mediaquerypixel, bluedark),
                      _Text('Masukan OTP yang sudah di kirm via Email',
                          FontWeight.w400, 9 * mediaquerypixel, bluedark),
                      const SizedBox(
                        height: 10,
                      ),
                      _OTPFieldInput(bluedark),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _Text('Tidak Menerima kode?', FontWeight.w400,
                              9 * mediaquerypixel, bluedark),
                          TextButton(
                            onPressed: () {},
                            child: _Text(' Kirim Ulang', FontWeight.w400,
                                9 * mediaquerypixel, Colors.blue),
                          )
                        ],
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }

  _OTPFieldInput(Color bordercolor) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: OtpTextField(
          numberOfFields: 4,
          borderColor: bordercolor,
          showCursor: true,
          showFieldAsBox: true,
          onCodeChanged: (String code) {},
          onSubmit: (String verificationcode) {
            print(verificationcode);
            String validasi = '1111';
            print('validasi$validasi');
            if (verificationcode == validasi) {
              print(verificationcode);
              Get.snackbar("Verifikasi Kode OTP",
                  'OTP $verificationcode sedang di proses',
                  colorText: Colors.white);
            } else {
              Get.snackbar(
                  "Verifikasi Kode OTP", 'OTP $verificationcode Tidak sama ',
                  backgroundColor: Color.fromARGB(255, 230, 126, 119),
                  colorText: Colors.white);
            }
          }),
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

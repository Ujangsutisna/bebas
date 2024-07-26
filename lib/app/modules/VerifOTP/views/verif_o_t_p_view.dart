// ignore_for_file: non_constant_identifier_names, unused_element, use_super_parameters
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import '../controllers/verif_o_t_p_controller.dart';

final _otpformkey = GlobalKey<FormState>();
final email = TextEditingController();
var bluedark = const Color(0xff2b3f85);
// var bluelight = const Color(0xff32529f);
// var yellowglobal = const Color(0xfff8ab1d);
var redglobal = const Color(0xffea1e35);

class VerifOTPView extends GetView<VerifOTPController> {
  const VerifOTPView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Size mediaquerysize = MediaQuery.of(context).size;

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
                  Container(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(
                              CupertinoIcons.arrow_left,
                              color: Colors.white,
                              size: 20,
                            )),
                        const Text('Verifikasi OTP',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 19,
                                color: Colors.white))
                      ],
                    ),
                  ),
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
              height: mediaquerysize.height * 0.7,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0))),
              child: Form(
                  key: _otpformkey,
                  child: Column(
                    children: [
                      Text('Verifikasi OTP ?',
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 22,
                              color: bluedark)),
                      Text('Masukan OTP yang sudah di kirm via Email',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: bluedark)),
                      const SizedBox(
                        height: 10,
                      ),
                      _OTPFieldInput(bluedark),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Tidak menerima kode ?',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: bluedark)),
                          TextButton(
                            onPressed: () {},
                            child: const Text('Kirim ulang',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: Colors.blue)),
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
            String validasi = '1111';

            if (verificationcode == validasi) {
              Get.offNamed('ubah-password');
            } else {
              Get.snackbar(
                  "Verifikasi Kode OTP", 'OTP $verificationcode Tidak sama ',
                  backgroundColor: redglobal, colorText: Colors.white);
            }
          }),
    );
  }
}

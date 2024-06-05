import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/beranda_controller.dart';

class BerandaView extends GetView<BerandaController> {
  const BerandaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var bluedark = const Color(0xff2b3f85);
    var bluelight = const Color(0xff32529f);
    var yellowglobal = const Color(0xfff8ab1d);
    var redglobal = const Color(0xffea1e35);
    return Scaffold(
        body: Container(
      margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Container(
        height: double.infinity,
        width: double.infinity,
        child: ListView(
          children: [
            // --------- container Informasi dan menu ---------
            Container(
              width: double.infinity,
              child: Column(children: [
                // Judul dan logout
                Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 261,
                          child: Text(
                            'SISTEM LAPORAN KKN',
                            style: GoogleFonts.getFont(
                              'Alumni Sans',
                              fontWeight: FontWeight.w700,
                              fontSize: 28,
                              height: 1.4,
                              color: bluedark,
                            ),
                          ),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0)),
                          ),
                          child: SizedBox(
                            width: 17.1,
                            height: 18.4,
                            child: IconButton(
                              onPressed: () {
                                Get.toNamed('login');
                              },
                              icon: const Icon(Icons.logout_outlined),
                              color: bluedark,
                              iconSize: 20,
                            ),
                          ),
                        ),
                      ]),
                ),
                // -----------data informasi pengguna-----------------
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                  padding: const EdgeInsets.all(26),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          bluelight,
                          bluedark,
                        ],
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0))),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: const Icon(Icons.people_alt_outlined),
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              child: Text(
                                'Ujang sutisna',
                                style: GoogleFonts.getFont(
                                  'Alumni Sans',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: const Color(0xFFFFFFFF),
                                ),
                              ),
                            ),
                            SizedBox(
                              child: Text(
                                '1121130123',
                                style: GoogleFonts.getFont(
                                  'Alumni Sans',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  color: const Color(0xFFFFFFFF),
                                ),
                              ),
                            ),
                            SizedBox(
                              child: Text(
                                'Teknik Informatika - SE',
                                style: GoogleFonts.getFont(
                                  'Alumni Sans',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  color: const Color(0xFFFFFFFF),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                //--------------------Menu-----------------------
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceEvenly, // Tetapkan untuk menggulir secara horizontal
                    children: [
                      _Menu_KKN(
                          'Daftar KKN', bluelight, bluelight, Icons.person),
                      // Tambahkan item menu ke dalam ListView
                      _Menu_KKN(
                          'Kelompok',
                          yellowglobal,
                          yellowglobal,
                          Icons
                              .people), // Tambahkan item menu ke dalam ListView
                      _Menu_KKN(
                          'Laporan',
                          redglobal,
                          redglobal,
                          Icons
                              .call_received), // Tambahkan item menu ke dalam ListView // Tambahkan item menu ke dalam ListView
                      // Tambahkan item menu lainnya sesuai kebutuhan
                    ],
                  ),
                )
              ]),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                'Jadwal KKN/KKP',
                style: GoogleFonts.getFont(
                  'Alumni Sans',
                  fontWeight: FontWeight.w600,
                  fontSize: 23,
                  height: 1.9,
                  color: bluedark,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              width: double.infinity,
              height: 300,
              child: ListView(scrollDirection: Axis.vertical, children: [
                _Jadwal_KKN(
                    'Pendaftaran KKN', '01 -25 januari 2024', '2023/2024'),
                _Jadwal_KKN(
                    'Pelaksaan KKN', 'Febuari - juli 2024', '2023/2024'),
                _Jadwal_KKN(
                    'Batas Laporan KKN', '30 - 31 agustus 2024', '2023/2024'),
                _Jadwal_KKN(
                    'Jadwal Sidang KKN', '16 - 21 September 2024', '2023/2024'),
                SizedBox(
                  height: 20,
                )
              ]),
            )
          ],
        ),
      ),
    ));
  }

  _Menu_KKN(String judul, Color colorText, colorbg, IconData icon) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              height: 60,
              width: 60,
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              decoration: BoxDecoration(
                color: colorbg,
                borderRadius: BorderRadius.circular(35),
              ),
              child: Icon(
                icon,
                color: Colors.white,
              )),
          Container(
            margin: const EdgeInsets.fromLTRB(9.4, 0, 9.4, 0),
            child: Text(
              judul,
              style: GoogleFonts.getFont(
                'Alumni Sans',
                fontWeight: FontWeight.w400,
                fontSize: 18,
                height: 1.1,
                color: colorText,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _Jadwal_KKN(String judul, tglpelaksanaan, tahunajar) {
    return Container(
      width: double.infinity,
      height: 100,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(
            color: Color.fromARGB(255, 197, 197, 197),
            width: 1,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(15))),
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      // ignore: prefer_const_constructors
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            judul,
            style: GoogleFonts.getFont('Alumni Sans',
                fontWeight: FontWeight.w600, fontSize: 18),
          ),
          SizedBox(
            height: 5,
          ),
          Text(tglpelaksanaan,
              style: GoogleFonts.getFont('Alumni Sans',
                  fontWeight: FontWeight.w300, fontSize: 16)),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Tahun Ajaran',
                  style: GoogleFonts.getFont('Alumni Sans',
                      fontWeight: FontWeight.w300, fontSize: 16)),
              Text(
                tahunajar,
                style: GoogleFonts.getFont('Alumni Sans',
                    fontWeight: FontWeight.w300, fontSize: 16),
              )
            ],
          ),
        ],
      ),
    );
  }
}

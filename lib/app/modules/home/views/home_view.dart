import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(0, 37, 0, 6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 2, 13.6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFFFFF),
                    ),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(15, 8, 15, 1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 13, 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 0, 19, 0),
                                  child: SizedBox(
                                    width: 261,
                                    child: Text(
                                      'SISTEM PENDAFTARAN KKN',
                                      style: GoogleFonts.getFont(
                                        'Alumni Sans',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 28,
                                        height: 1.4,
                                        color: const Color(0xFF587DC4),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(0, 1, 0, 2),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF587DC4),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Container(
                                      width: 35,
                                      height: 35,
                                      padding: const EdgeInsets.fromLTRB(
                                          6, 10, 11.9, 6.6),
                                      child: const SizedBox(
                                        width: 17.1,
                                        height: 18.4,
                                        child: Icon(Icons.people),
                                      ),
                                    ), 
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 12),
                            child: Stack(
                              children: [
                                Positioned(
                                  left: -23,
                                  right: -17,
                                  top: -17,
                                  bottom: -30,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: const SizedBox(
                                      width: 328,
                                      height: 116,
                                      child: Icon(Icons.abc),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 328,
                                  child: Container(
                                    padding: const EdgeInsets.fromLTRB(
                                        23, 17, 17, 30),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 3, 12, 6),
                                              child: const SizedBox(
                                                width: 60,
                                                height: 60,
                                                child: Icon(Icons.abc),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 69,
                                              child: Stack(
                                                children: [
                                                  Text(
                                                    'Ujang sutisna',
                                                    style: GoogleFonts.getFont(
                                                      'Alumni Sans',
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 20,
                                                      height: 1.9,
                                                      color: const Color(
                                                          0xFFFFFFFF),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 0,
                                                    bottom: 14,
                                                    child: SizedBox(
                                                      height: 38,
                                                      child: Text(
                                                        '1121130123',
                                                        style:
                                                            GoogleFonts.getFont(
                                                          'Alumni Sans',
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          fontSize: 14,
                                                          height: 2.7,
                                                          color: const Color(
                                                              0xFFFFFFFF),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 0,
                                                    bottom: 0,
                                                    child: SizedBox(
                                                      height: 38,
                                                      child: Text(
                                                        'Teknik Informatika',
                                                        style:
                                                            GoogleFonts.getFont(
                                                          'Alumni Sans',
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          fontSize: 14,
                                                          height: 2.7,
                                                          color: const Color(
                                                              0xFFFFFFFF),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              0, 24, 0, 24),
                                          child: Container(
                                            
                                            child: Container(
                                              width: 21,
                                              height: 21,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFEDECEC),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Container(
                                        width: 70,
                                        height: 70,
                                        child: const Positioned(
                                          left: 19.9,
                                          top: 12,
                                          child: SizedBox(
                                            width: 29.3,
                                            height: 43.4,
                                            child: Icon(Icons.abc),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          3.5, 0, 9.1, 0),
                                      child: Text(
                                        'Daftar KKN',
                                        style: GoogleFonts.getFont(
                                          'Alumni Sans',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18,
                                          height: 2.1,
                                          color: const Color(0xFF000000),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 9),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 9),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFEDECEC),
                                            borderRadius:
                                                BorderRadius.circular(35),
                                          ),
                                          child: Container(
                                            width: 70,
                                            height: 70,
                                            child: const Positioned(
                                              left: 8.5,
                                              bottom: 19.7,
                                              child: SizedBox(
                                                width: 52.4,
                                                height: 30.3,
                                                child: Icon(Icons.abc),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            9.4, 0, 9.4, 0),
                                        child: Text(
                                          'Kelompok',
                                          style: GoogleFonts.getFont(
                                            'Alumni Sans',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 18,
                                            height: 1.1,
                                            color: const Color(0xFF313131),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 9),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 9),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFEDECEC),
                                            borderRadius:
                                                BorderRadius.circular(35),
                                          ),
                                          child: Container(
                                            width: 70,
                                            height: 70,
                                            child: const Positioned(
                                              right: 18.4,
                                              bottom: 15.2,
                                              child: SizedBox(
                                                width: 31.6,
                                                height: 36.8,
                                                child: Icon(Icons.abc),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            13, 0, 14.6, 0),
                                        child: Text(
                                          'Laporan',
                                          style: GoogleFonts.getFont(
                                            'Alumni Sans',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 18,
                                            height: 1.1,
                                            color: const Color(0xFF313131),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 3, 4.1),
                          child: Stack(
                            children: [
                              Positioned(
                                top: 0.1,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFFFFFFF),
                                  ),
                                  child: Container(
                                    width: 325,
                                    height: 29,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  'Penjadwalan KKN/KKP',
                                  style: GoogleFonts.getFont(
                                    'Alumni Sans',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 23,
                                    height: 1.7,
                                    color: const Color(0xFF000000),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 13),
                          child: Stack(
                            children: [
                              const Positioned(
                                left: -14.4,
                                right: -14.4,
                                top: -13,
                                bottom: -6.1,
                                child: SizedBox(
                                  width: 328,
                                  height: 105.1,
                                  child: Icon(Icons.abc),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.fromLTRB(
                                    14.4, 13, 14.4, 6.1),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          0.1, 0, 0.1, 6),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          'Pendaftaran KKN',
                                          style: GoogleFonts.getFont(
                                            'Roboto Condensed',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            height: 1.4,
                                            color: const Color(0xFF313131),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          0.1, 0, 0.1, 12.9),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          '01 - 15 Mei 2024',
                                          style: GoogleFonts.getFont(
                                            'Roboto Condensed',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            height: 1.3,
                                            color: const Color(0xFF777777),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          0, 0, 0, 8.2),
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          color: Color(0xFFDBDBDB),
                                        ),
                                        child: Container(
                                          width: 299.3,
                                          height: 1,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          0.1, 0, 13.3, 0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 0, 9, 2),
                                            child: SizedBox(
                                              width: 215.9,
                                              child: Text(
                                                'Gelombang 1',
                                                style: GoogleFonts.getFont(
                                                  'Roboto Condensed',
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                  height: 1.3,
                                                  color:
                                                      const Color(0xFF777777),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            '2024/2025',
                                            style: GoogleFonts.getFont(
                                              'Roboto Condensed',
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                              height: 1.4,
                                              color: const Color(0xFF3A3A3A),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 10, 13),
                          child: Stack(
                            children: [
                              const Positioned(
                                left: -13.9,
                                right: -13.9,
                                top: -13,
                                bottom: -6.1,
                                child: SizedBox(
                                  width: 318,
                                  height: 105.1,
                                  child: Icon(Icons.abc),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.fromLTRB(
                                    13.9, 13, 13.9, 6.1),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          0.1, 0, 0.1, 6),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          'Pendaftaran KKN',
                                          style: GoogleFonts.getFont(
                                            'Roboto Condensed',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            height: 1.4,
                                            color: const Color(0xFF313131),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 10, 13),
                          child: Stack(
                            children: [
                              const Positioned(
                                left: -13.9,
                                right: -13.9,
                                top: -13,
                                bottom: -6.1,
                                child: SizedBox(
                                    width: 318,
                                    height: 105.1,
                                    child: Icon(Icons.abc)),
                              ),
                              Container(
                                padding: const EdgeInsets.fromLTRB(
                                    13.9, 13, 13.9, 6.1),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          0.1, 0, 0.1, 6),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          'Pelaksanaan KKN',
                                          style: GoogleFonts.getFont(
                                            'Roboto Condensed',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            height: 1.4,
                                            color: const Color(0xFF313131),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          0.1, 0, 0.1, 12.9),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          '01 Juli - Agustus 2024',
                                          style: GoogleFonts.getFont(
                                            'Roboto Condensed',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            height: 1.3,
                                            color: const Color(0xFF777777),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          0, 0, 0, 8.2),
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          color: Color(0xFFDBDBDB),
                                        ),
                                        child: Container(
                                          width: 290.2,
                                          height: 1,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          0.1, 0, 11, 0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 0, 9, 2),
                                            child: SizedBox(
                                              width: 209,
                                              child: Text(
                                                'xxxxxxx',
                                                style: GoogleFonts.getFont(
                                                  'Roboto Condensed',
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                  height: 1.3,
                                                  color:
                                                      const Color(0xFF777777),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            '2024/2025',
                                            style: GoogleFonts.getFont(
                                              'Roboto Condensed',
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                              height: 1.4,
                                              color: const Color(0xFF3A3A3A),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: Stack(
                            children: [
                              const Positioned(
                                left: -13.9,
                                right: -13.9,
                                top: -13,
                                bottom: -6.1,
                                child: SizedBox(
                                    width: 318,
                                    height: 105.1,
                                    child: Icon(Icons.on_device_training)),
                              ),
                              Container(
                                padding: const EdgeInsets.fromLTRB(
                                    13.9, 13, 13.9, 6.1),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          0.1, 0, 0.1, 6),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          'Jadwal Sidang KKN',
                                          style: GoogleFonts.getFont(
                                            'Roboto Condensed',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            height: 1.4,
                                            color: const Color(0xFF313131),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          0.1, 0, 0.1, 12.9),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          '23 - 25 Oktober 2024',
                                          style: GoogleFonts.getFont(
                                            'Roboto Condensed',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            height: 1.3,
                                            color: const Color(0xFF777777),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          0, 0, 0, 8.2),
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          color: Color(0xFFDBDBDB),
                                        ),
                                        child: Container(
                                          width: 290.2,
                                          height: 1,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          0.1, 0, 11, 0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 0, 9, 2),
                                            child: SizedBox(
                                              width: 209,
                                              child: Text(
                                                'Prodi Teknik Informatika',
                                                style: GoogleFonts.getFont(
                                                  'Roboto Condensed',
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                  height: 1.3,
                                                  color:
                                                      const Color(0xFF777777),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            '2024/2025',
                                            style: GoogleFonts.getFont(
                                              'Roboto Condensed',
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                              height: 1.4,
                                              color: const Color(0xFF3A3A3A),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFFFFFFFF),
              ),
              child: Container(
                width: 360,
                height: 27,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

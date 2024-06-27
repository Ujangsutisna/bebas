// ignore_for_file: non_constant_identifier_names

import 'package:bebas/app/data/model/Mahasiswa.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/beranda_controller.dart';

var bluedark = const Color(0xff2b3f85);
var bluelight = const Color(0xff32529f);
var yellowglobal = const Color.fromRGBO(248, 171, 29, 1);
var redglobal = const Color(0xffea1e35);
var greenglo = const Color(0xff06880b);

class BerandaView extends GetView<BerandaController> {
  const BerandaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Size mdsize = MediaQuery.of(context).size;
    final double mdsizepixel = MediaQuery.of(context).devicePixelRatio;
    return Scaffold(
        body: Theme(
      data: ThemeData(colorScheme: ColorScheme.light(primary: bluedark)),
      child: Container(
        width: mdsize.width,
        height: mdsize.height,
        decoration: BoxDecoration(
          color: bluedark,
        ),
        margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: Column(
          children: [
            // --------- container Informasi dan menu ---------
            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Judul dan logout
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 261,
                            child: Text(
                              'SISTEM PENDAFTARAN KKN',
                              style: TextStyle(
                                  fontSize: 10 * mdsizepixel,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
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
                                  Get.back();
                                },
                                icon: const Icon(Icons.logout_outlined),
                                color: Colors.white,
                                iconSize: 20,
                              ),
                            ),
                          ),
                        ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // -----------data informasi pengguna-----------------
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          padding: const EdgeInsets.all(15),
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Colors.white,
                                  Colors.white,
                                ],
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          child: SizedBox(
                            height: 70,
                            width: 170,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 60,
                                      width: 60,
                                      margin: const EdgeInsets.fromLTRB(
                                          0, 0, 10, 0),
                                      decoration: BoxDecoration(
                                          color: bluedark,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(30))),
                                      child: const Icon(
                                        CupertinoIcons.person_solid,
                                        color: Colors.white,
                                        size: 45.0,
                                      ),
                                    ),
                                    Obx(() {
                                      final mahasiswaValue =
                                          controller.mahasiswa.value;
                                      return mahasiswaValue != null &&
                                              mahasiswaValue.ID_Mahasiswa !=
                                                  null
                                          ? _DataMahasiswa(
                                              controller.mahasiswa.value!)
                                          : const Center(
                                              child:
                                                  CircularProgressIndicator());
                                    })
                                    // data mahasiswa d kolom
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        //--------------------Menu-----------------------
                        Expanded(
                          child: Container(
                            height: 120,
                            padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                            child: ListView(
                              scrollDirection: Axis
                                  .horizontal, // Tetapkan untuk menggulir secara horizontal
                              children: [
                                _Menu_KKN(
                                    'Kelompok',
                                    yellowglobal,
                                    Colors.white,
                                    CupertinoIcons.group_solid,
                                    ''),
                                _Menu_KKN('Daftar KKN', Colors.white, bluedark,
                                    CupertinoIcons.square_list, 'daftarkkn'),
                                // Tambahkan item menu ke dalam ListView
                                // Tambahkan item menu ke dalam ListView
                                _Menu_KKN(
                                    'Laporan',
                                    greenglo,
                                    Colors.white,
                                    CupertinoIcons.doc_plaintext,
                                    ''), // Tambahkan item menu ke dalam ListView // Tambahkan item menu ke dalam ListView
                                // Tambahkan item menu lainnya sesuai kebutuhan
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ]),
            ),

            Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 2),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                    )),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        'Agenda KKN',
                        style: TextStyle(
                    fontSize: 12*mdsizepixel,
                    fontWeight: FontWeight.w600,
                    color: bluedark)
                      ),
                    ),
                    Divider(),
                    SizedBox(
                        width: double.infinity,
                        height: mdsize.height * 0.6,
                        child: Obx(() {
                          return controller.agendalist.isEmpty
                              ? const Center(child: CircularProgressIndicator())
                              : ListView.builder(
                                  itemCount: controller.agendalist.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final agenda = controller.agendalist[index];
                                    return _Jadwal_KKN(agenda.Nama_Agenda,
                                        agenda.Tgl_Pelaksanaan, agenda.Periode);
                                  },
                                );
                        })),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }

  _Menu_KKN(String judul, colorbg, coloricon, IconData icon, String page) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(page);
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 17, 0),
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
                  color: coloricon,
                  size: 35.0,
                )),
            Container(
              margin: const EdgeInsets.fromLTRB(9.4, 0, 9.4, 0),
              child: Text(
                judul,
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _Jadwal_KKN(String judul, tglpelaksanaan, tahunajar) {
    return Container(
      width: double.infinity,
      height: 100,
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
      decoration: BoxDecoration(
          border: Border.all(
            color: bluedark,
            width: 1,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(15))),
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      // ignore: prefer_const_constructors
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(judul,
              style: TextStyle(
                  fontSize: 13, fontWeight: FontWeight.w600, color: bluedark)),
          const SizedBox(
            height: 5,
          ),
          Text(
            tglpelaksanaan,
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w300, color: bluedark),
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tahun Ajaran',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: bluedark),
              ),
              Text(
                tahunajar,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: bluedark),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _DataMahasiswa(Mahasiswa mahasiswa) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          child: Text(
            mahasiswa.Nama_Mahasiswa,
            style: GoogleFonts.getFont(
              'Alumni Sans',
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: bluedark,
            ),
          ),
        ),
        SizedBox(
          child: Text(
            mahasiswa.Prodi.Nama_Prodi,
            style: GoogleFonts.getFont(
              'Alumni Sans',
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: bluedark,
            ),
          ),
        ),
        SizedBox(
          child: Text(
            '${mahasiswa.ID_Mahasiswa}',
            style: GoogleFonts.getFont(
              'Alumni Sans',
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: bluedark,
            ),
          ),
        ),
      ],
    );
  }
}

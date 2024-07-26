import 'package:auto_size_text/auto_size_text.dart';
import 'package:bebas/app/data/Helpers/user_info.dart';
import 'package:bebas/app/data/user_model.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import '../controllers/home_controller.dart';

var bluedark = const Color(0xff2b3f85);
var bluelight = const Color(0xff32529f);
var yellowglobal = const Color.fromRGBO(248, 171, 29, 1);
var redglobal = const Color(0xffea1e35);
var greenglo = const Color(0xff06880b);

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Size mdsize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(height:mdsize.height,
        child: Stack(
          children: [
            Positioned(
              child: Container(
                padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
                width: double.infinity,
                height: 240,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(6),
                        bottomRight: Radius.circular(6)),
                    gradient: LinearGradient(
                      colors: [Color(0xff3f5efb), Color(0xff2e4a94)],
                      stops: [0.2, 0.7],
                      begin: Alignment(-0.0, 1.0),
                      end: Alignment(-0.0, -0.9),
                    )),
                child: Column(children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 261,
                          child: AutoSizeText(
                            'SISTEM PENDAFTARAN KKN',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(25.0)),
                          ),
                          child: SizedBox(
                            width: 17.1,
                            height: 18.4,
                            child: IconButton(
                              onPressed: () {
                                UserInfo().logout();
                                Get.offAllNamed('login');
                              },
                              icon: const Icon(
                                CupertinoIcons.bell_fill,
                              ),
                              color: Colors.white,
                              iconSize: 20,
                            ),
                          ),
                        ),
                      ]),
                  const SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        CupertinoIcons.person_crop_circle_fill,
                        color: Colors.white,
                        size: 60.0,
                      ),
                      const SizedBox(width: 15),
                      Obx(() {
                        if (controller.dataUser.value.ID == null) {
                          return Container(
                              child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const CircularProgressIndicator(
                                color: Colors.white,
                              ),
                              TextButton(
                                  onPressed: () {
                                    controller.LoadData();
                                  },
                                  child: const Text('Refresh',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400)))
                            ],
                          ));
                        } else if (controller.dataUser.value.nama != null) {
                          print('ID :::: ${controller.dataUser.value.ID}');
                          return _DataUser(controller.dataUser.value);
                        } else {
                          return const Text('No data');
                        }
                      })
                    ],
                  ),
                ]),
              ),
            ),
            Positioned(
                right: 20,
                left: 20,
                top: 165,
                child: Center(
                  child: Container(
                    height: 130,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white),
                    width: mdsize.width,
                    padding: const EdgeInsets.all(5),
                    child: Obx(() {
                      final userType = controller.userType.value;
                      return Center(
                        child: Wrap(
                          spacing: 2.0, // jarak horizontal antar anak
                          runSpacing: 9.0, // jarak vertikal antar baris
                          alignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          runAlignment: WrapAlignment.center,
                          children: [
                            if (userType == 'mahasiswa')
                              _Menu_KKN("Daftar KKN", bluedark,
                                  CupertinoIcons.list_bullet,
                                  isDaftar: true), // --------- Mahasiswa
                            if (userType == 'mahasiswa')
                              _Menu_KKN("Program Kerja", greenglo,
                                  Icons.post_add_rounded,
                                  isProgram: true), // --------- Mahasiswa
                            if (userType == 'mahasiswa')
                              _Menu_KKN("Kelompok", yellowglobal, Icons.group,
                                  page: ''), // --------- Mahasiswa
                            if (userType == 'mahasiswa')
                              _Menu_KKN("Laporan", bluedark, Icons.book,
                                  isLaporan: true), // --------- Mahasiswa
                            if (userType == 'dosen_pembimbing')
                              _Menu_KKN("Approve", bluedark, Icons.list_alt_sharp,
                                  page: ''), // --------- Dospem
                            if (userType == 'dosen_pembimbing')
                              _Menu_KKN('Kelompok', yellowglobal, Icons.group,
                                  isProgramDospem: true), // --------- Dospem
                            _Menu_KKN("Logout", redglobal, Icons.logout_outlined,
                                isBack: true),
                          ],
                        ),
                      );
                    }),
                  ),
                )),
            Obx(() {
              final userType = controller.userType.value;
              return userType == 'mahasiswa'
                  ? Positioned(
                      top: 300,
                      child: SizedBox(
                        width: mdsize.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Informasi Lainnya',
                                style: TextStyle(
                                    color: bluedark,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600)),
                            const Divider(),
                            Obx(() {
                              final currenStep =
                                  controller.currentIndexPageView.value;
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  MaterialButton(
                                      onPressed: () {
                                        controller.btnPageChanged(0);
                                      },
                                      child: Icon(Icons.list_rounded,
                                          color: currenStep == 0
                                              ? bluedark
                                              : const Color.fromARGB(
                                                  255, 233, 232, 232))),
                                  MaterialButton(
                                      onPressed: () {
                                        controller.btnPageChanged(1);
                                      },
                                      child: Icon(Icons.post_add_sharp,
                                          color: currenStep == 1
                                              ? bluedark
                                              : const Color.fromARGB(
                                                  255, 233, 232, 232))),
                                  MaterialButton(
                                      onPressed: () {
                                        controller.btnPageChanged(2);
                                      },
                                      child: Icon(Icons.date_range,
                                          color: currenStep == 2
                                              ? bluedark
                                              : const Color.fromARGB(
                                                  255, 233, 232, 232))),
                                ],
                              );
                            }),
                            Container(
                              height: 200,
                                  child: _pageViewBeranda(),                  )
                          ],
                        ),
                      ))
                  : const SizedBox();
            })
          ],
        ),
      ),
    );
  }

  _pageViewBeranda() {
  
    return PageView(
      controller: controller.PageViewCtrl,
      onPageChanged: ((value) {
        controller.onPageChanged(value);
      }),
      children: const [

        Text('k'),
        Text('k'),
        Text('k'),
        Text('h'),
      ],
    );
  }

  _Menu_KKN(String judul, color, IconData icon,
      {String? page,
      bool isBack = false,
      bool isDaftar = false,
      bool isProgram = false,
      bool isProgramDospem = false,
      bool isLaporan = false}) {
    final user = controller.dataUser.value.nama;
    return Container(
      width: 90,
      child: GestureDetector(
        onTap: () {
          if (isBack) {
            _DialogKeluar();
          } else if (isDaftar && user!.isNotEmpty) {
            final kelompok = controller.Kelompok;
            if (kelompok.value.idKelompok != null &&
                kelompok.value.approve != 'reject') {
              Get.toNamed('review', arguments: kelompok.value);
            } else {
              Get.toNamed('daftarkkn');
            }
          } else if (isProgram && user!.isNotEmpty) {
            _isProgram();
          } else if (isLaporan && user!.isNotEmpty) {
            final kelompok = controller.Kelompok.value;
            Get.toNamed('laporan', arguments: kelompok);
          } else if (page != null) {
            Get.toNamed(page);
          } else if (user!.isEmpty) {
            Get.snackbar('Maaf', 'Data tidak di temukan',
                backgroundColor: Colors.red, colorText: Colors.white);
          } else if (isProgramDospem) {
            Get.toNamed('kelompok-dospem',
                arguments: controller.dataUser.value);
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: color,
              size: 30.0,
            ),
            Container(
              child: Text(
                judul,
                style: TextStyle(
                    fontSize: 12, fontWeight: FontWeight.w400, color: color),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _DialogKeluar() {
    return Get.defaultDialog(
        content: Column(
          children: [
            Icon(Icons.cancel_outlined, size: 80.0, color: redglobal),
            const SizedBox(
              height: 10,
            ),
            const Text('Apakah anda yakin?')
          ],
        ),
        title: '',
        cancel: MaterialButton(
          color: greenglo,
          onPressed: () async {
            Get.back();
          },
          child: const Text('Batal', style: TextStyle(color: Colors.white)),
        ),
        textConfirm: 'Keluar',
        confirm: MaterialButton(
          color: redglobal,
          onPressed: () async {
            UserInfo().logout();
            Get.offAllNamed('login');
          },
          child: const Text('Keluar', style: TextStyle(color: Colors.white)),
        ));
  }

  _isProgram() {
    final kelompok = controller.Kelompok;
    if (kelompok.value.idKelompok != null &&
        kelompok.value.approve == "approve") {
      return Get.toNamed('programkerja', arguments: kelompok.value);
    } else if (kelompok.value.idKelompok != null &&
        kelompok.value.approve! == 'review') {
      return _alertDialog('Maaf', 'Pendaftaran anda di review, Cek berkala');
    } else if (kelompok.value.idKelompok != null &&
        kelompok.value.approve! == 'reject') {
      return _alertDialog(
          'Maaf', 'Pendaftaran anda di tolak, Silahkan daftar ulang');
    } else {
      return _alertDialog('Maaf', 'Silahkan daftar terlebii dahulu');
    }
  }

  _alertDialog(String title, String middletext) {
    return Get.defaultDialog(
        titleStyle: TextStyle(color: redglobal, fontWeight: FontWeight.w600),
        title: title,
        middleText: middletext,
        radius: 10,
        cancel: MaterialButton(
          color: greenglo,
          onPressed: () {
            Get.back();
          },
          child: const Text('Kembali', style: TextStyle(color: Colors.white)),
        ));
  }

  Widget _DataUser(DataUser user) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          child: AutoSizeText(
            '${user.nama}',
            style: GoogleFonts.getFont(
              'Alumni Sans',
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          child: AutoSizeText(
            '${user.email}',
            style: GoogleFonts.getFont(
              'Alumni Sans',
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: const Color.fromARGB(255, 244, 244, 244),
            ),
          ),
        ),
      ],
    );
  }
}

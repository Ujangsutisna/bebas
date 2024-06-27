// class Mahasiswa {
//   String? ID_Mahasiswa;
//   late String Nama_Mahasiswa, Prodi, Konsentrasi;
//   Mahasiswa(
//       {this.ID_Mahasiswa,
//       required this.Nama_Mahasiswa,
//       required this.Prodi,
//       required this.Konsentrasi});
//   factory Mahasiswa.fromJson(Map<String, dynamic> json) => Mahasiswa(
//         ID_Mahasiswa: json['ID_Mahasiswa'],
//         Nama_Mahasiswa: json['Nama_Mahasiswa'],
//         Prodi: json['Prodi'],
//         Konsentrasi: json['Konsentrasi'],
//       );
//   Map<String, dynamic> tojson() => {
//         "Nama_Mahasiswa": Nama_Mahasiswa,
//         "Prodi": Prodi,
//         "Konsentrasi": Konsentrasi
//       };
// }

import 'package:bebas/app/data/model/JenisGender.dart';
import 'package:bebas/app/data/model/Kelas.dart';
import 'package:bebas/app/data/model/Prodi.dart';

class Mahasiswa {
  String? ID_Mahasiswa;
  late String Nama_Mahasiswa, Alamat, Nomor_Telp, Tanggal_Lahir;
  late JenisGender ID_Gender;
  late Kelas ID_Kelas;
  late ProdiPT Prodi;

  Mahasiswa({
    this.ID_Mahasiswa,
    required this.Nama_Mahasiswa,
    required this.Alamat,
    required this.Nomor_Telp,
    required this.Tanggal_Lahir,
    required this.ID_Gender,
    required this.ID_Kelas,
    required this.Prodi,
  });

  factory Mahasiswa.fromJson(Map<String, dynamic> json) => Mahasiswa(
        ID_Mahasiswa: json['ID_Mahasiswa'],
        Nama_Mahasiswa: json['Nama_Mahasiswa'],
        Alamat: json['Alamat'],
        Nomor_Telp: json['Nomor_Telp'],
        Tanggal_Lahir: json['Tanggal_Lahir'],
        ID_Gender: JenisGender.fromJson(json['ID_Gender']),
        ID_Kelas: Kelas.fromJson(json['ID_Kelas']),
        Prodi: ProdiPT.fromJson(json['Prodi']),
      );

  Map<String, dynamic> toJson() => {
        "ID_Mahasiswa": ID_Mahasiswa,
        "Nama_Mahasiswa": Nama_Mahasiswa,
        "Alamat": Alamat,
        "Nomor_Telp": Nomor_Telp,
        "Tanggal_Lahir": Tanggal_Lahir,
        "ID_Gender": ID_Gender,
        "ID_Kelas": ID_Kelas,
        "Prodi": Prodi,
      };
}

class Gender {}

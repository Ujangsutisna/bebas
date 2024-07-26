import 'package:bebas/app/data/mahasiswa_model.dart';

class Allkelompokget {
  List<KelompokGet>? kelompokGet;

  Allkelompokget({this.kelompokGet});
  Allkelompokget.fromJson(List<dynamic> jsonList) {
    if (jsonList.isNotEmpty) {
      kelompokGet = [];
      jsonList.forEach((v) {
        kelompokGet!.add(KelompokGet.fromJson(v));
      });
    }
  }
}

class KelompokGet {
  int? idKelompok;
  dynamic idDospem;
  String? nimKetuaKelompok;
  String? approve;
  String? lokasiKkn;
  String? jenis;
  String? penanggungJawab;
  String? nomorTelephonePenanggungJawab;
  String? tanggalMulai;
  String? tanggalAkhir;
  String? createdAt;
  String? updatedAt;
  List<Anggota>? anggota;

  KelompokGet(
      {this.idKelompok,
      this.idDospem,
      this.nimKetuaKelompok,
      this.approve,
      this.lokasiKkn,
      this.jenis,
      this.penanggungJawab,
      this.nomorTelephonePenanggungJawab,
      this.tanggalMulai,
      this.tanggalAkhir,
      this.createdAt,
      this.updatedAt,
      this.anggota});

  KelompokGet.fromJson(Map<String, dynamic> json) {
    idKelompok = json['id_kelompok'];
    idDospem = json['id_dospem'];
    nimKetuaKelompok = json['nim_ketua_kelompok'];
    approve = json['approve'];
    lokasiKkn = json['lokasi_kkn'];
    jenis = json['jenis'];
    penanggungJawab = json['penanggung_jawab'];
    nomorTelephonePenanggungJawab = json['nomor_telephone_penanggung_jawab'];
    tanggalMulai = json['tanggal_mulai'];
    tanggalAkhir = json['tanggal_akhir'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['anggota'] != null) {
      anggota = <Anggota>[];
      json['anggota'].forEach((v) {
        anggota?.add(Anggota.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id_kelompok'] = idKelompok;
    data['id_dospem'] = idDospem;
    data['nim_ketua_kelompok'] = nimKetuaKelompok;
    data['approve'] = approve;
    data['lokasi_kkn'] = lokasiKkn;
    data['jenis'] = jenis;
    data['penanggung_jawab'] = penanggungJawab;
    data['nomor_telephone_penanggung_jawab'] = nomorTelephonePenanggungJawab;
    data['tanggal_mulai'] = tanggalMulai;
    data['tanggal_akhir'] = tanggalAkhir;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (anggota != null) {
      data['anggota'] = anggota?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Anggota {
  int? idAnggota;
  int? idKelompok;
  String? nimMahasiswa;
  String? createdAt;
  String? updatedAt;
  Mahasiswa? detail;

  Anggota(
      {this.idAnggota,
      this.idKelompok,
      this.nimMahasiswa,
      this.createdAt,
      this.updatedAt});

  Anggota.fromJson(Map<String, dynamic> json) {
    idAnggota = json['id_anggota'];
    idKelompok = json['id_kelompok'];
    nimMahasiswa = json['nim_mahasiswa'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    detail = json['detail'] != null ? Mahasiswa.fromJson(json['detail']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id_anggota'] = idAnggota;
    data['id_kelompok'] = idKelompok;
    data['nim_mahasiswa'] = nimMahasiswa;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class AllLaporanModel {
  List<LaporanModel>? laporan;

  AllLaporanModel({this.laporan});
  AllLaporanModel.fromJson(List<dynamic> jsonList) {
    if (jsonList.isNotEmpty) {
      laporan = [];
      jsonList.forEach((v) {
        laporan!.add(LaporanModel.fromJson(v));
      });
    }
  }
}

class LaporanModel {
  int? idLaporan;
  String? judulLaporan;
  String? bodyLaporan;
  String? fileLaporan;
  int? idKelompok;
  String? approve;
  String? createAt;
  String? updateAt;

  LaporanModel(
      {this.idLaporan,
      this.judulLaporan,
      this.bodyLaporan,
      this.fileLaporan,
      this.idKelompok,
      this.approve,
      this.createAt,
      this.updateAt});

  LaporanModel.fromJson(Map<String, dynamic> json) {
    idLaporan = json['id_laporan'];
    judulLaporan = json['judul_laporan'];
    bodyLaporan = json['body_laporan'];
    fileLaporan = json['file_laporan'];
    idKelompok = json['id_kelompok'];
    approve = json['approve'];
    createAt = json['created_at'];
    updateAt = json['updated_at'];
  }

  Map<String, dynamic> toJsonStatus() {
    final data = <String, dynamic>{};
    data['status'] = approve;
    data['id_kelompok'] = idKelompok;
    return data;
  }
}

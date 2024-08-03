class AllProgramKerjaGet {
  List<ProgramKerjaGet>? programKerja;

  AllProgramKerjaGet({this.programKerja});

  AllProgramKerjaGet.fromJson(List<dynamic> json) {
    if (json.isNotEmpty) {
      programKerja = [];
      json.forEach((v) {
        programKerja!.add(ProgramKerjaGet.fromJson(v));
      });
    }
  }
}

class ProgramKerjaGet {
  int? idProker;
  String? judulProker;
  String? bodyProker;
  int? idKelompok;
  String? approve;
  String? tanggalMulai;
  String? tanggalSelesai;
  String? createAt;
  String? updateAt;

  ProgramKerjaGet(
      {this.idProker,
      this.judulProker,
      this.bodyProker,
      this.idKelompok,
      this.approve,
      this.tanggalMulai,
      this.tanggalSelesai,
      this.createAt,
      this.updateAt});
  ProgramKerjaGet.fromJson(Map<String, dynamic> json) {
    idProker = json["id_proker"];
    judulProker = json["judul_proker"];
    bodyProker = json["body_proker"];
    idKelompok = json["id_kelompok"];
    approve = json["approve"];
    tanggalMulai = json['tanggal_mulai'];
    tanggalSelesai = json['tanggal_selesai'];
    createAt = json["created_At"];
    updateAt = json["updated_at"];
  }
  Map<String, dynamic> toJsonStatus() {
    final data = <String, dynamic>{};
    data['status'] = approve;
    return data;
  }

  Map<String, dynamic> toJsonUpdateTanggal() {
    final data = <String, dynamic>{};
    data['tanggal_mulai'] = tanggalMulai;
    data['tanggal_selesai'] = tanggalSelesai;
    return data;
  }
}

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
  String? createAt;
  String? updateAt;

  ProgramKerjaGet(
      {this.idProker,
      this.judulProker,
      this.bodyProker,
      this.idKelompok,
      this.approve,
      this.createAt,
      this.updateAt});
  ProgramKerjaGet.fromJson(Map<String, dynamic> json) {
    idProker = json["id_proker"];
    judulProker = json["judul_proker"];
    bodyProker = json["body_proker"];
    idKelompok = json["id_kelompok"];
    approve = json["approve"];
    createAt = json["created_At"];
    updateAt = json["updated_at"];
  }
  Map<String, dynamic> toJsonStatus() {
    final data = <String, dynamic>{};
    data['status'] = approve;
    return data;
  }
}

class AllPenilaianModel {
  List<PenilaianModel>? penilaian;

  AllPenilaianModel({this.penilaian});
  AllPenilaianModel.fromJson(List<dynamic> jsonList) {
    if (jsonList.isNotEmpty) {
      penilaian = [];
      jsonList.forEach((v) {
        penilaian!.add(PenilaianModel.fromJson(v));
      });
    }
  }
}

class PenilaianModel {
  String? nim;
  int? nilai;
  String? nilaiPost;
  String? jenisNilai;

  PenilaianModel({this.nim, this.nilai, this.nilaiPost, this.jenisNilai});
  PenilaianModel.fromJson(Map<String, dynamic> json) {
    nim = json['nim_mahasiswa'];
    nilai = json['nilai'];
    jenisNilai = json['jenis_nilai'];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['nim'] = nim;
    data['nilai'] = nilaiPost;
    data['jenis_nilai'] = jenisNilai;
    return data;
  }
}

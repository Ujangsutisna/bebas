class AllSidangModel {
  List<SidangModel>? sidangModel;

  AllSidangModel({this.sidangModel});

  AllSidangModel.fromJson(List<dynamic> json) {
    if (json.isNotEmpty) {
      sidangModel = [];
      json.forEach((v) {
        sidangModel!.add(SidangModel.fromJson(v));
      });
    }
  }
}

class SidangModel {
  int? idSidang;
  String? judulSidang;
  String? title;
  String? body;
  String? tanggalSidang;
  String? approve;
  int? idKelompok;
  String? createAt;
  String? updateAt;

  SidangModel(
      {this.idSidang,
      this.judulSidang,
      this.title,
      this.body,
      this.tanggalSidang,
      this.approve,
      this.idKelompok,
      this.createAt,
      this.updateAt});

  SidangModel.fromJson(Map<String, dynamic> json) {
    idSidang = json['id_sidang'];
    judulSidang = json['judul_sidang'];
    body = json['body_sidang'];
    tanggalSidang = json['tanggal_sidang'];
    approve = json['approve'];
    idKelompok = json['id_kelompok'];
    createAt = json['created_at'];
    updateAt = json['updated_at'];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['body'] = body;
    data['tanggal_sidang'] = tanggalSidang;
    data['id_kelompok'] = idKelompok;
    return data;
  }
}

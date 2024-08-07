
class AllBimbinganModel {
  List<BimbinganModel>? bimbinganModel;

  AllBimbinganModel({this.bimbinganModel});
  AllBimbinganModel.fromJson(List<dynamic> jsonList) {
    if (jsonList.isNotEmpty) {
      bimbinganModel = [];
      jsonList.forEach((v) {
        bimbinganModel!.add(BimbinganModel.fromJson(v));
      });
    }
  }
}
class BimbinganModel {
  int? idBimbingan;
  String? judul;
  String? title;
  String? body;
  String? linkBimbingan;
  String? tanggalBimbingan;
  int? idKelompok;
  int? idDospem;
  BimbinganModel(
      {this.idBimbingan,
      this.title,
      this.body,
      this.linkBimbingan,
      this.tanggalBimbingan,
      this.judul,
      this.idKelompok,
      this.idDospem});
  BimbinganModel.fromJson(Map<String, dynamic> json) {
    idBimbingan = json['id_bimbingan'];
    judul = json['judul'];
    body = json['body'];
    tanggalBimbingan = json['tanggal_bimbingan'];
    linkBimbingan = json['link_bimbingan'];
    idKelompok = json['id_kelompok'];
    idDospem = json['id_dospem'];
  }

  Map<String, dynamic> toJsonPost() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['body'] = body;
    data['link_bimbingan'] = linkBimbingan;
    data['tanggal_bimbingan'] = tanggalBimbingan;
    data['id_kelompok'] = idKelompok;
    return data;
  }
}

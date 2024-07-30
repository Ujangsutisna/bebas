class BimbinganModel {
  String? title;
  String? body;
  String? linkBimbingan;
  String? tanggalBimbingan;
  int? idKelompok;
  BimbinganModel(
      {this.title,
      this.body,
      this.linkBimbingan,
      this.tanggalBimbingan,
      this.idKelompok});
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

class KelompokPost {
  List<String>? anggota;
  String? lokasiKkn;
  String? jenis;
  String? penanggungJawab;
  String? nomorTelephonePenanggungJawab;
  String? tanggalMulai;
  String? tanggalAkhir;

  KelompokPost(
      {this.anggota,
      this.lokasiKkn,
      this.jenis,
      this.penanggungJawab,
      this.nomorTelephonePenanggungJawab,
      this.tanggalMulai,
      this.tanggalAkhir});

  KelompokPost.fromJson(Map<String, dynamic> json) {
    anggota = json['anggota'].cast<String>();
    lokasiKkn = json['lokasi_kkn'];
    jenis = json['jenis'];
    penanggungJawab = json['penanggung_jawab'];
    nomorTelephonePenanggungJawab = json['nomor_telephone_penanggung_jawab'];
    tanggalMulai = json['tanggal_mulai'];
    tanggalAkhir = json['tanggal_akhir'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['anggota'] = anggota;
    data['lokasi_kkn'] = lokasiKkn;
    data['jenis'] = jenis;
    data['penanggung_jawab'] = penanggungJawab;
    data['nomor_telephone_penanggung_jawab'] = nomorTelephonePenanggungJawab;
    data['tanggal_mulai'] = tanggalMulai;
    data['tanggal_akhir'] = tanggalAkhir;
    return data;
  }
}

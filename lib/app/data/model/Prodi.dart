class ProdiPT {
  String? ID_Prodi;
  late String Nama_Prodi;

  ProdiPT({
    this.ID_Prodi,
    required this.Nama_Prodi,
  });

  factory ProdiPT.fromJson(Map<String, dynamic> json) => ProdiPT(
        ID_Prodi: json['ID_Prodi'],
        Nama_Prodi: json['Nama_Prodi'],
      );

  Map<String, dynamic> toJson() => {
        "Nama_Prodi": Nama_Prodi,
      };
}

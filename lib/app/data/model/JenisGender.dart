class JenisGender {
  String? ID_Gender;
  late String Nama_Gender;

 JenisGender({
    this.ID_Gender,
    required this.Nama_Gender,
  });

  factory JenisGender.fromJson(Map<String, dynamic> json) => JenisGender(
    ID_Gender: json['ID_Gender'],
    Nama_Gender: json['Nama_Gender'],
  );

  Map<String, dynamic> toJson() => {
    "Nama_Gender": Nama_Gender,
  };
}



class Kelas{

  String? ID_Kelas;
  late String Nama_Kelas, Nama_PA ;
  Kelas(
      {this.ID_Kelas,
      required this.Nama_Kelas,
      required this.Nama_PA,
     });
  factory Kelas.fromJson(Map<String, dynamic> json) => Kelas(
        ID_Kelas: json['ID_Kelas'],
        Nama_Kelas: json['Nama_Kelas'],
        Nama_PA: json['Nama_PA'],
  
      );
  Map<String, dynamic> tojson() => {
    "Nama_Kelas"  : Nama_Kelas,
    "Nama_PA"           : Nama_PA,

  };

}


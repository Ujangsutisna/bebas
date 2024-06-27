// ignore_for_file: non_constant_identifier_names

class Agenda {
  String? ID_Agenda;
  late String Nama_Agenda, Tgl_Pelaksanaan, Periode;
  Agenda(
      {this.ID_Agenda,
      required this.Nama_Agenda,
      required this.Tgl_Pelaksanaan,
      required this.Periode});
  factory Agenda.fromJson(Map<String, dynamic> json) => Agenda(
      ID_Agenda: json['ID_Agenda'],
      Nama_Agenda: json['Nama_Agenda'],
      Tgl_Pelaksanaan: json['Tgl_Pelaksanaan'],
      Periode: json['Periode']);

  Map<String, dynamic> toJson() => {
        'Nama_Agenda': Nama_Agenda,
        'Tgl_Pelaksanaan' : Tgl_Pelaksanaan,
        'Periode' : Periode
      };
}

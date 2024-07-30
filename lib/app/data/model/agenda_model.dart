// ignore_for_file: avoid_function_literals_in_foreach_calls

class AllAgenda {
  List<AgendaKKN>? agendaKKN;

  AllAgenda({this.agendaKKN});

  AllAgenda.fromJson(List<dynamic> jsonList) {
    if (jsonList.isNotEmpty) {
      agendaKKN = [];
      jsonList.forEach((v) {
        agendaKKN!.add(AgendaKKN.fromJson(v));
      });
    }
  }

   Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (agendaKKN != null) {
      data['agendaKKN'] = agendaKKN!.map((v) => v.toJson()).toList();
    }
    return data;
  }
 
}

class AgendaKKN {
  String? iDAgenda;
  String? namaAgenda;
  String? tglPelaksanaan;
  String? periode;

  AgendaKKN(
      {this.iDAgenda, this.namaAgenda, this.tglPelaksanaan, this.periode});

  AgendaKKN.fromJson(Map<String, dynamic> json) {
    iDAgenda = json['ID_Agenda'];
    namaAgenda = json['Nama_Agenda'];
    tglPelaksanaan = json['Tgl_Pelaksanaan'];
    periode = json['Periode'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['ID_Agenda'] = iDAgenda;
    data['Nama_Agenda'] = namaAgenda;
    data['Tgl_Pelaksanaan'] = tglPelaksanaan;
    data['Periode'] = periode;
    return data;
  }
}

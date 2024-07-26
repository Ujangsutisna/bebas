class AllMahasiswa {
  List<Mahasiswa>? mahasiswa;

  AllMahasiswa({this.mahasiswa});

  AllMahasiswa.fromJson(List<dynamic> json) {
    if (json.isNotEmpty) {
      mahasiswa = [];
      json.forEach((v) {
        mahasiswa!.add(Mahasiswa.fromJson(v));
      });
    }
  }

}

class Mahasiswa {
  String? nim;
  String? nama;
  String? tanggalLahir;
  String? alamat;
  String? nomorTelephone;
  int? idGender;
  int? idKelas;
  int? idProdi;
  int? idUser;
  String? createdAt;
  String? updatedAt;
  User? user;
  Prodi? prodi;
  Kelas? kelas;
  Gender? gender;

  Mahasiswa(
      {this.nim,
      this.nama,
      this.tanggalLahir,
      this.alamat,
      this.nomorTelephone,
      this.idGender,
      this.idKelas,
      this.idProdi,
      this.idUser,
      this.createdAt,
      this.updatedAt,
      this.user,
      this.prodi,
      this.kelas,
      this.gender});

  Mahasiswa.fromJson(Map<String, dynamic> json) {
    nim = json['nim'];
    nama = json['nama'];
    tanggalLahir = json['tanggal_lahir'];
    alamat = json['alamat'];
    nomorTelephone = json['nomor_telephone'];
    idGender = json['id_gender'];
    idKelas = json['id_kelas'];
    idProdi = json['id_prodi'];
    idUser = json['id_user'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? User?.fromJson(json['user']) : null;
    prodi = json['prodi'] != null ? Prodi?.fromJson(json['prodi']) : null;
    kelas = json['kelas'] != null ? Kelas?.fromJson(json['kelas']) : null;
    gender = json['gender'] != null ? Gender?.fromJson(json['gender']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['nim'] = nim;
    data['nama'] = nama;
    data['tanggal_lahir'] = tanggalLahir;
    data['alamat'] = alamat;
    data['nomor_telephone'] = nomorTelephone;
    data['id_gender'] = idGender;
    data['id_kelas'] = idKelas;
    data['id_prodi'] = idProdi;
    data['id_user'] = idUser;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (user != null) {
      data['user'] = user?.toJson();
    }
    if (prodi != null) {
      data['prodi'] = prodi?.toJson();
    }
    if (kelas != null) {
      data['kelas'] = kelas?.toJson();
    }
    if (gender != null) {
      data['gender'] = gender?.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  String? tipeAkun;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.tipeAkun,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    tipeAkun = json['tipe_akun'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['tipe_akun'] = tipeAkun;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Prodi {
  int? idProdi;
  String? namaProdi;
  String? createdAt;
  String? updatedAt;

  Prodi({this.idProdi, this.namaProdi, this.createdAt, this.updatedAt});

  Prodi.fromJson(Map<String, dynamic> json) {
    idProdi = json['id_prodi'];
    namaProdi = json['nama_prodi'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id_prodi'] = idProdi;
    data['nama_prodi'] = namaProdi;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Kelas {
  int? idKelas;
  String? namaKelas;
  String? namaPa;
  String? createdAt;
  String? updatedAt;

  Kelas(
      {this.idKelas,
      this.namaKelas,
      this.namaPa,
      this.createdAt,
      this.updatedAt});

  Kelas.fromJson(Map<String, dynamic> json) {
    idKelas = json['id_kelas'];
    namaKelas = json['nama_kelas'];
    namaPa = json['nama_pa'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id_kelas'] = idKelas;
    data['nama_kelas'] = namaKelas;
    data['nama_pa'] = namaPa;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Gender {
  int? idGender;
  String? namaGender;
  String? createdAt;
  String? updatedAt;

  Gender({this.idGender, this.namaGender, this.createdAt, this.updatedAt});

  Gender.fromJson(Map<String, dynamic> json) {
    idGender = json['id_gender'];
    namaGender = json['nama_gender'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id_gender'] = idGender;
    data['nama_gender'] = namaGender;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

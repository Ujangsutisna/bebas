class DataUser {
  int? ID;
  String? nama;
  String? email;

  DataUser({
    this.ID,
    this.nama,
    this.email
  });
  DataUser.fromJson(Map<String, dynamic> json) {
    ID = json['id'];
    nama = json['name'];
    email = json['email'];
  }
}

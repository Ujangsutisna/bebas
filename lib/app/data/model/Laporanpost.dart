class LaporanPost {
  String? title;
  String? body;

  LaporanPost({this.title, this.body});

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['body'] = body;
    return data;
  }
}

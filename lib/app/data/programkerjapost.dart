class ProgramKerjaPost {
  String? title;
  String? body;

  ProgramKerjaPost({this.title, this.body});

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['body'] = body;
    return data;
  }
}

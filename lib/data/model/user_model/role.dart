class Role {
  Role({
    required this.id,
    required this.title,
  });
  late final int id;
  late final String title;

  Role.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    return _data;
  }
}

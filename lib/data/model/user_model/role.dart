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
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    return data;
  }
}

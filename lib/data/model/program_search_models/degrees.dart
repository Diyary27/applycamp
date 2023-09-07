class Degrees {
  Degrees({
    required this.id,
    required this.title,
    required this.order,
  });
  late final int id;
  late final String title;
  late final int order;

  Degrees.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['order'] = order;
    return _data;
  }
}

class Degree {
  Degree({
    required this.id,
    required this.title,
    required this.order,
  });
  late final int id;
  late final String title;
  late final int order;

  Degree.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['order'] = order;
    return _data;
  }
}

class Currency {
  Currency({
    required this.id,
    required this.title,
    required this.order,
  });
  late final int id;
  late final String title;
  late final int order;

  Currency.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['order'] = order;
    return data;
  }
}

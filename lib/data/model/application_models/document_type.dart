class DocumentType {
  DocumentType({
    required this.id,
    required this.title,
    required this.order,
    required this.slug,
    required this.isRequired,
  });
  late final int id;
  late final String title;
  late final int order;
  late final String slug;
  late final bool isRequired;

  DocumentType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    order = json['order'];
    slug = json['slug'];
    isRequired = json['isRequired'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['order'] = order;
    _data['slug'] = slug;
    _data['isRequired'] = isRequired;
    return _data;
  }
}

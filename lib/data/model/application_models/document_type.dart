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
    order = json['ordering'];
    slug = json['slug'];
    isRequired = json['isRequired'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['order'] = order;
    data['slug'] = slug;
    data['isRequired'] = isRequired;
    return data;
  }
}

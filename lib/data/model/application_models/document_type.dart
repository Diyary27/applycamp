class DocumentType {
  DocumentType({
    this.id,
    this.title,
    this.order,
    this.slug,
    this.isRequired,
  });
  final int? id;
  final String? title;
  final int? order;
  final String? slug;
  final bool? isRequired;

  factory DocumentType.fromJson(Map<String, dynamic> json) {
    return DocumentType(
      id: json['id'],
      title: json['title'],
      order: json['order'],
      slug: json['slug'],
      isRequired: json['isRequired'],
    );
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

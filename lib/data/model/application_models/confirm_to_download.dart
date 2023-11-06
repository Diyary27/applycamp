class ConfirmToDownload {
  ConfirmToDownload({
    required this.id,
    required this.title,
    required this.slug,
    required this.ordering,
  });
  late final int id;
  late final String title;
  late final String slug;
  late final int ordering;

  ConfirmToDownload.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    ordering = json['ordering'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['slug'] = slug;
    data['ordering'] = ordering;
    return data;
  }
}

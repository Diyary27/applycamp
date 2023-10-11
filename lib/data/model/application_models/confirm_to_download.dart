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
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['slug'] = slug;
    _data['ordering'] = ordering;
    return _data;
  }
}

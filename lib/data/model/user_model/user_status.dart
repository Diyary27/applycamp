class UserStatus {
  UserStatus({
    required this.slug,
    required this.title,
    required this.ordering,
    required this.color,
    required this.bgColor,
  });
  late final String slug;
  late final String title;
  late final int ordering;
  late final String color;
  late final String bgColor;

  UserStatus.fromJson(Map<String, dynamic> json) {
    slug = json['slug'];
    title = json['title'];
    ordering = json['ordering'];
    color = json['color'];
    bgColor = json['bgColor'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['slug'] = slug;
    _data['title'] = title;
    _data['ordering'] = ordering;
    _data['color'] = color;
    _data['bgColor'] = bgColor;
    return _data;
  }
}

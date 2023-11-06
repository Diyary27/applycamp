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
    final data = <String, dynamic>{};
    data['slug'] = slug;
    data['title'] = title;
    data['ordering'] = ordering;
    data['color'] = color;
    data['bgColor'] = bgColor;
    return data;
  }
}

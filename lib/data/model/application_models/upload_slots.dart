class UploadSlots {
  List<UploadSlot?>? required;
  List<UploadSlot?>? optional;

  UploadSlots({
    this.required,
    this.optional,
  });
  UploadSlots.fromJson(Map<String, dynamic> json) {
    if (json['optional'] != null) {
      final v = json['optional'];
      final arr0 = <UploadSlot>[];
      v.forEach((v) {
        arr0.add(UploadSlot.fromJson(v));
      });
      optional = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (optional != null) {
      final v = optional;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['optional'] = arr0;
    }
    return data;
  }
}

class UploadSlot {
/*
{
  "id": 1,
  "title": "پذیرش مشروط",
  "slug": "conditional-acceptance",
  "ordering": 1
} 
*/

  late final int? id;
  late final String? title;
  late final String? slug;
  late final int? ordering;

  UploadSlot({
    this.id,
    this.title,
    this.slug,
    this.ordering,
  });
  UploadSlot.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    title = json['title']?.toString();
    slug = json['slug']?.toString();
    ordering = json['ordering']?.toInt();
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

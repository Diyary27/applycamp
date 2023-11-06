class Image {
  Image({
    required this.id,
    required this.uuid,
    this.name,
    required this.path,
    required this.realPath,
    required this.mime,
    required this.extension,
    this.note,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String uuid;
  late final String? name;
  late final String path;
  late final String realPath;
  late final String mime;
  late final String extension;
  late final String? note;
  late final String createdAt;
  late final String updatedAt;

  Image.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    name = null;
    path = json['path'];
    realPath = json['realPath'];
    mime = json['mime'];
    extension = json['extension'];
    note = null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['uuid'] = uuid;
    data['name'] = name;
    data['path'] = path;
    data['realPath'] = realPath;
    data['mime'] = mime;
    data['extension'] = extension;
    data['note'] = note;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

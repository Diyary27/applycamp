class ProfileImage {
  ProfileImage({
    required this.id,
    required this.uuid,
    required this.name,
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
  late final String name;
  late final String path;
  late final String realPath;
  late final String mime;
  late final String extension;
  late final Null note;
  late final String createdAt;
  late final String updatedAt;

  ProfileImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    name = json['name'];
    path = json['path'];
    realPath = json['realPath'];
    mime = json['mime'];
    extension = json['extension'];
    note = null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['uuid'] = uuid;
    _data['name'] = name;
    _data['path'] = path;
    _data['realPath'] = realPath;
    _data['mime'] = mime;
    _data['extension'] = extension;
    _data['note'] = note;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    return _data;
  }
}

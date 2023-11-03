class File {
  File({
    required this.id,
    required this.uuid,
    required this.name,
    required this.path,
    required this.realPath,
    required this.mime,
    required this.extension,
    required this.note,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final String? uuid;
  final String? name;
  final String? path;
  final String? realPath;
  final String? mime;
  final String? extension;
  final dynamic note;
  final String? createdAt;
  final String? updatedAt;

  factory File.fromJson(Map<String, dynamic> json) {
    return File(
      id: json["id"],
      uuid: json["uuid"],
      name: json["name"],
      path: json["path"],
      realPath: json["realPath"],
      mime: json["mime"],
      extension: json["extension"],
      note: json["note"],
      createdAt: json["createdAt"],
      updatedAt: json["updatedAt"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "name": name,
        "path": path,
        "realPath": realPath,
        "mime": mime,
        "extension": extension,
        "note": note,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}

import 'package:applycamp/data/model/file.dart';
import 'package:applycamp/data/model/program_search_models/degrees.dart';

class StudentDocument {
  StudentDocument({
    required this.id,
    required this.type,
    required this.files,
  });

  final int id;
  final Degree? type;
  final List<File> files;

  factory StudentDocument.fromJson(Map<String, dynamic> json) {
    return StudentDocument(
      id: json["id"],
      type: json["type"] == null ? null : Degree.fromJson(json["type"]),
      files: json["files"] == null
          ? []
          : List<File>.from(json["files"]!.map((x) => File.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type?.toJson(),
        "files": files.map((x) => x?.toJson()).toList(),
      };
}

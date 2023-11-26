import 'package:applycamp/data/model/application_models/document_type.dart';
import 'package:applycamp/data/model/file_element.dart';

class StudentDocument {
  StudentDocument({
    this.id,
    this.type,
    required this.files,
  });

  final int? id;
  final DocumentType? type;
  final List<FileElement> files;

  factory StudentDocument.fromJson(Map<String, dynamic> json) {
    return StudentDocument(
      id: json["id"],
      type: json["type"] == null ? null : DocumentType.fromJson(json["type"]),
      files: json["files"] == null
          ? []
          : List<FileElement>.from(
              json["files"]!.map((x) => FileElement.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type?.toJson(),
        "files": files.map((x) => x.toJson()).toList(),
      };
}

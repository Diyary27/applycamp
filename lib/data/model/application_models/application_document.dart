import 'package:applycamp/data/model/application_models/upload_slots.dart';
import 'package:applycamp/data/model/file_element.dart';

class ApplicationDocument {
  ApplicationDocument({
    required this.id,
    required this.typeId,
    required this.applicationId,
    required this.type,
    required this.files,
  });

  final int? id;
  final int? typeId;
  final int? applicationId;
  final UploadSlot? type;
  final List<FileElement> files;

  factory ApplicationDocument.fromJson(Map<String, dynamic> json) {
    return ApplicationDocument(
      id: json["id"],
      typeId: json["typeId"],
      applicationId: json["applicationId"],
      type: json["type"] == null ? null : UploadSlot.fromJson(json["type"]),
      files: json["files"] == null
          ? []
          : List<FileElement>.from(
              json["files"]!.map((x) => FileElement.fromJson(x))),
    );
  }
}

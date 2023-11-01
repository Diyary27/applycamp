import 'package:applycamp/data/model/application_models/upload_slots.dart';
import 'package:applycamp/data/model/file.dart';

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
  final List<File> files;

  factory ApplicationDocument.fromJson(Map<String, dynamic> json) {
    return ApplicationDocument(
      id: json["id"],
      typeId: json["typeId"],
      applicationId: json["applicationId"],
      type: json["type"] == null ? null : UploadSlot.fromJson(json["type"]),
      files: json["files"] == null
          ? []
          : List<File>.from(json["files"]!.map((x) => File.fromJson(x))),
    );
  }
}

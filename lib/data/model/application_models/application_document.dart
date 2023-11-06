import 'package:applycamp/data/model/application_models/upload_slots.dart';
import 'package:applycamp/data/model/file_response.dart';

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
  final List<FileResponse> files;

  factory ApplicationDocument.fromJson(Map<String, dynamic> json) {
    return ApplicationDocument(
      id: json["id"],
      typeId: json["typeId"],
      applicationId: json["applicationId"],
      type: json["type"] == null ? null : UploadSlot.fromJson(json["type"]),
      files: json["files"] == null
          ? []
          : List<FileResponse>.from(
              json["files"]!.map((x) => FileResponse.fromJson(x))),
    );
  }
}

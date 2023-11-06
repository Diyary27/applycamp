import 'package:applycamp/data/model/program_search_models/abilities.dart';

class StudyField {
  StudyField({
    required this.id,
    required this.title,
    required this.can,
  });
  late final int id;
  late final String title;
  late final Can can;

  StudyField.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    can = Can.fromJson(json['can']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['can'] = can.toJson();
    return data;
  }
}

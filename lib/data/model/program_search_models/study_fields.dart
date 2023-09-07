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
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['can'] = can.toJson();
    return _data;
  }
}

import 'package:applycamp/data/model/program_search_models/abilities.dart';

class StudyLanguage {
  StudyLanguage({
    required this.id,
    required this.title,
    required this.order,
    required this.can,
  });
  late final int id;
  late final String title;
  late final int order;
  late final Can can;

  StudyLanguage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    order = json['order'];
    can = Can.fromJson(json['can']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['order'] = order;
    _data['can'] = can.toJson();
    return _data;
  }
}

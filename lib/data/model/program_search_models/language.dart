import 'package:applycamp/data/model/program_search_models/abilities.dart';

class Language {
  Language({
    required this.id,
    required this.title,
    required this.order,
    required this.can,
  });
  late final int id;
  late final String title;
  late final int order;
  late final Can can;

  Language.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    order = json['order'];
    can = Can.fromJson(json['can']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['order'] = order;
    data['can'] = can.toJson();
    return data;
  }
}

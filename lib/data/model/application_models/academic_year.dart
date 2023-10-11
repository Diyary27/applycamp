import 'package:applycamp/data/model/program_search_models/abilities.dart';

class AcademicYear {
  AcademicYear({
    required this.slug,
    required this.start,
    required this.end,
    required this.title,
    required this.isActive,
    required this.can,
  });
  late final String slug;
  late final int start;
  late final int end;
  late final String title;
  late final bool isActive;
  late final Can can;

  AcademicYear.fromJson(Map<String, dynamic> json) {
    slug = json['slug'];
    start = json['start'];
    end = json['end'];
    title = json['title'];
    isActive = json['isActive'];
    can = Can.fromJson(json['can']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['slug'] = slug;
    _data['start'] = start;
    _data['end'] = end;
    _data['title'] = title;
    _data['isActive'] = isActive;
    _data['can'] = can.toJson();
    return _data;
  }
}

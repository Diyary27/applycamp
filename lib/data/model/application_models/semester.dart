import 'package:applycamp/data/model/application_models/semester_can.dart';

class Semester {
  Semester({
    required this.id,
    required this.title,
    required this.academicYearSlug,
    required this.ordering,
    required this.isActive,
    required this.can,
  });
  late final String id;
  late final String title;
  late final String academicYearSlug;
  late final int ordering;
  late final bool isActive;
  late final SemesterCan can;

  Semester.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    academicYearSlug = json['academicYearSlug'];
    ordering = json['ordering'];
    isActive = json['isActive'];
    can = SemesterCan.fromJson(json['can']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['academicYearSlug'] = academicYearSlug;
    _data['ordering'] = ordering;
    _data['isActive'] = isActive;
    _data['can'] = can.toJson();
    return _data;
  }
}

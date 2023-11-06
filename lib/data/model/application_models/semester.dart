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
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['academicYearSlug'] = academicYearSlug;
    data['ordering'] = ordering;
    data['isActive'] = isActive;
    data['can'] = can.toJson();
    return data;
  }
}

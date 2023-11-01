import 'package:applycamp/data/model/application_models/academic_year.dart';
import 'package:applycamp/data/model/program_search_models/country.dart';
import 'package:applycamp/data/model/program_search_models/degrees.dart';
import 'package:applycamp/data/model/program_search_models/program.dart';
import 'package:applycamp/data/model/program_search_models/school.dart';
import 'package:applycamp/data/model/program_search_models/school_types.dart';
import 'package:applycamp/data/model/program_search_models/study_languages.dart';
import 'package:applycamp/data/model/student_model/student_model.dart';

class ApplicationCreateFields {
  ApplicationCreateFields({
    required this.degrees,
    required this.countries,
    required this.schoolTypes,
    required this.studyLanguages,
    required this.academicYears,
    required this.schools,
    required this.programs,
    required this.student,
  });
  late final List<Degree> degrees;
  late final List<Country> countries;
  late final List<SchoolType> schoolTypes;
  late final List<StudyLanguage> studyLanguages;
  late final List<AcademicYear> academicYears;
  late final List<School> schools;
  late final List<Program> programs;
  late final Student student;

  ApplicationCreateFields.fromJson(Map<String, dynamic> json) {
    degrees =
        List.from(json['degrees']).map((e) => Degree.fromJson(e)).toList();
    countries =
        List.from(json['countries']).map((e) => Country.fromJson(e)).toList();
    schoolTypes = List.from(json['schoolTypes'])
        .map((e) => SchoolType.fromJson(e))
        .toList();
    studyLanguages = List.from(json['studyLanguages'])
        .map((e) => StudyLanguage.fromJson(e))
        .toList();
    academicYears = List.from(json['academicYears'])
        .map((e) => AcademicYear.fromJson(e))
        .toList();
    schools =
        List.from(json['schools']).map((e) => School.fromJson(e)).toList();
    programs =
        List.from(json['programs']).map((e) => Program.fromJson(e)).toList();
    student = Student.fromJson(json['student']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['degrees'] = degrees.map((e) => e.toJson()).toList();
    _data['countries'] = countries.map((e) => e.toJson()).toList();
    _data['schoolTypes'] = schoolTypes.map((e) => e.toJson()).toList();
    _data['studyLanguages'] = studyLanguages.map((e) => e.toJson()).toList();
    _data['academicYears'] = academicYears.map((e) => e.toJson()).toList();
    _data['schools'] = schools.map((e) => e.toJson()).toList();
    _data['programs'] = programs.map((e) => e.toJson()).toList();
    _data['student'] = student.toJson();
    return _data;
  }
}

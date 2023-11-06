import 'package:applycamp/data/model/program_search_models/city.dart';
import 'package:applycamp/data/model/program_search_models/country.dart';
import 'package:applycamp/data/model/program_search_models/degrees.dart';
import 'package:applycamp/data/model/program_search_models/school_types.dart';
import 'package:applycamp/data/model/program_search_models/school.dart';
import 'package:applycamp/data/model/program_search_models/specialities.dart';
import 'package:applycamp/data/model/program_search_models/study_fields.dart';
import 'package:applycamp/data/model/program_search_models/study_languages.dart';
import 'package:applycamp/data/model/program_search_models/tuition_units.dart';

class ProgramSearchFields {
  ProgramSearchFields({
    required this.schoolTypes,
    required this.studyLanguages,
    required this.studyFields,
    required this.specialities,
    required this.degrees,
    required this.countries,
    required this.cities,
    required this.tuitionUnits,
    required this.schools,
    required this.lowestTuitionFee,
    required this.highestTuitionFee,
  });
  late final List<SchoolType> schoolTypes;
  late final List<StudyLanguage> studyLanguages;
  late final List<StudyField> studyFields;
  late final List<Specialities> specialities;
  late final List<Degree> degrees;
  late final List<Country> countries;
  late final List<City> cities;
  late final List<TuitionUnits> tuitionUnits;
  late final List<School> schools;
  late final int lowestTuitionFee;
  late final int highestTuitionFee;

  ProgramSearchFields.fromJson(Map<String, dynamic> json) {
    schoolTypes = List.from(json['schoolTypes'])
        .map((e) => SchoolType.fromJson(e))
        .toList();
    studyLanguages = List.from(json['studyLanguages'])
        .map((e) => StudyLanguage.fromJson(e))
        .toList();
    studyFields = List.from(json['studyFields'])
        .map((e) => StudyField.fromJson(e))
        .toList();
    specialities = List.from(json['specialities'])
        .map((e) => Specialities.fromJson(e))
        .toList();
    degrees =
        List.from(json['degrees']).map((e) => Degree.fromJson(e)).toList();
    countries =
        List.from(json['countries']).map((e) => Country.fromJson(e)).toList();
    cities = List.from(json['cities']).map((e) => City.fromJson(e)).toList();
    tuitionUnits = List.from(json['tuitionUnits'])
        .map((e) => TuitionUnits.fromJson(e))
        .toList();
    schools =
        List.from(json['schools']).map((e) => School.fromJson(e)).toList();
    lowestTuitionFee = json['lowestTuitionFee'];
    highestTuitionFee = json['highestTuitionFee'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['schoolTypes'] = schoolTypes.map((e) => e.toJson()).toList();
    data['studyLanguages'] = studyLanguages.map((e) => e.toJson()).toList();
    data['studyFields'] = studyFields.map((e) => e.toJson()).toList();
    data['specialities'] = specialities.map((e) => e.toJson()).toList();
    data['degrees'] = degrees.map((e) => e.toJson()).toList();
    data['countries'] = countries.map((e) => e.toJson()).toList();
    data['cities'] = cities.map((e) => e.toJson()).toList();
    data['tuitionUnits'] = tuitionUnits.map((e) => e.toJson()).toList();
    data['schools'] = schools.map((e) => e.toJson()).toList();
    data['lowestTuitionFee'] = lowestTuitionFee;
    data['highestTuitionFee'] = highestTuitionFee;
    return data;
  }
}

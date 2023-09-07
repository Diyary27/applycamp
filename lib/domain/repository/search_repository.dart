import 'package:applycamp/data/model/program_search_models/cities.dart';
import 'package:applycamp/data/model/program_search_models/school_programs.dart';
import 'package:applycamp/data/model/program_search_models/schools.dart';
import 'package:applycamp/data/model/program_search_models/study_fields.dart';

abstract class SearchRepository {
  Future<List<City>> getAllCities();
  Future<List<School>> getAllSchools();
  Future<List<StudyField>> getAllStudyFields();
}
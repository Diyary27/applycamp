import 'package:applycamp/data/model/program_search_models/city.dart';
import 'package:applycamp/data/model/program_search_models/school.dart';
import 'package:applycamp/data/model/program_search_models/study_fields.dart';
import 'package:applycamp/domain/entity/program_search_params.dart';

abstract class SearchRepository {
  Future<List<City>> getAllCities();
  Future getSchoolsByCity(int id);
  Future<List<School>> getAllSchools();
  Future<List<StudyField>> getAllStudyFields();
  Future getProgramsByStudyField(int id);
  Future getFieldsToSearch();
  Future searchPrograms(SearchParams searchParams);
  Future searchSchools(SearchParams searchParams);
}

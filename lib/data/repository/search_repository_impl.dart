import 'package:applycamp/data/model/program_search_models/cities.dart';
import 'package:applycamp/data/model/program_search_models/school_programs.dart';
import 'package:applycamp/data/model/program_search_models/schools.dart';
import 'package:applycamp/data/model/program_search_models/study_fields.dart';
import 'package:applycamp/data/source/search_data_source.dart';
import 'package:applycamp/domain/entity/program_search_params.dart';
import 'package:applycamp/domain/repository/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchDataSource dataSource;

  SearchRepositoryImpl(this.dataSource);
  @override
  Future<List<City>> getAllCities() async => dataSource.getAllCities();

  @override
  Future<List<School>> getAllSchools() async => dataSource.getAllSchools();

  @override
  Future<List<StudyField>> getAllStudyFields() async =>
      dataSource.getAllStudyFields();

  @override
  Future getFieldsToSearch() async => dataSource.getFieldsToSearch();

  @override
  Future searchPrograms(ProgramSearchParams programSearchParams) async {
    return dataSource.searchPrograms(programSearchParams.toJson());
  }
}

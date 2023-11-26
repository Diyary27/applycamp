import 'package:applycamp/core/common/dio_consumer.dart';
import 'package:applycamp/core/constant/remote_constant.dart';
import 'package:applycamp/data/model/program_search_models/city.dart';
import 'package:applycamp/data/model/program_search_models/country.dart';
import 'package:applycamp/data/model/program_search_models/programs_search_fields.dart';
import 'package:applycamp/data/model/program_search_models/school_programs.dart';
import 'package:applycamp/data/model/program_search_models/school.dart';
import 'package:applycamp/data/model/program_search_models/study_fields.dart';

abstract class SearchDataSource {
  Future<List<City>> getAllCities();
  Future getSchoolsByCity(int id);
  Future<List<School>> getAllSchools();
  Future<List<StudyField>> getAllStudyFields();
  Future getProgramsByStudyField(int id);
  Future getFieldsToSearch();
  Future searchPrograms(Map<String, dynamic> searchParams);
  Future searchSchools(Map<String, dynamic> searchParams);
}

class SearchDataSourceImpl implements SearchDataSource {
  final PortalDioConsumer dioConsumer;

  SearchDataSourceImpl(this.dioConsumer);

  @override
  Future<List<City>> getAllCities() async {
    final response = await dioConsumer.get(PortalRemoteConstants.getAllCities);

    // here we get the cities response as countries model which contain their cities
    final List countriesWithCities = [];
    for (var element in (response.data['countries'] as List)) {
      countriesWithCities.add(Country.fromJson(element));
    }

    // we collect the cities from countries list into another list
    final List<City> cities = [];
    for (var element in countriesWithCities) {
      for (var city in (element.cities as List)) {
        cities.add(city);
      }
    }

    return cities;
  }

  // این موقته و هنوز اندپویت اصلی داده نشده
  @override
  Future<List<School>> getAllSchools() async {
    final response =
        await dioConsumer.get(PortalRemoteConstants.getProgramSearchFields);

    final List<School> schoolsList = [];
    for (var element in (response.data["schools"] as List)) {
      schoolsList.add(School.fromJson(element));
    }
    return schoolsList;
  }

  @override
  Future<List<StudyField>> getAllStudyFields() async {
    final response =
        await dioConsumer.get(PortalRemoteConstants.getAllStudyFields);

    final List<StudyField> studyFields = [];
    for (var element in (response.data["studyFields"] as List)) {
      studyFields.add(StudyField.fromJson(element));
    }

    return studyFields;
  }

  @override
  Future getFieldsToSearch() async {
    final response =
        await dioConsumer.get(PortalRemoteConstants.getProgramSearchFields);

    final programSearchFields = ProgramSearchFields.fromJson(response.data);
    return programSearchFields;
  }

  @override
  Future searchPrograms(Map<String, dynamic> searchParams) async {
    final response = await dioConsumer.get(PortalRemoteConstants.searchPrograms,
        queryParameters: searchParams);
    print(response.data);
    print('cc');
    final schoolPrograms = SchoolPrograms.fromJson(response.data);

    return schoolPrograms;
  }

  @override
  Future searchSchools(Map<String, dynamic> searchParams) async {
    final response = await dioConsumer.get(
        PortalRemoteConstants.getSchoolsNormalUser,
        queryParameters: searchParams);

    final List<School> schools = [];
    for (var element in (response.data['schools'] as List)) {
      schools.add(School.fromJson(element));
    }

    return schools;
  }

  @override
  Future getProgramsByStudyField(int id) async {
    final response = await dioConsumer.get(
        PortalRemoteConstants.getProgramsByStudyField +
            id.toString() +
            "/programs?list=paginate&perPage=20");

    final schoolPrograms = SchoolPrograms.fromJson(response.data);

    return schoolPrograms;
  }

  @override
  Future getSchoolsByCity(int id) async {
    final response = await dioConsumer.get(
        PortalRemoteConstants.getSchoolsByCity + id.toString() + "/schools");

    final List<School> schools = [];
    (response.data["schools"] as List).forEach((element) {
      schools.add(School.fromJson(element));
    });
    return schools;
  }
}

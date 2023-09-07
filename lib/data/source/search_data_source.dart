import 'dart:math';

import 'package:applycamp/core/common/dio_consumer.dart';
import 'package:applycamp/core/constant/remote_constant.dart';
import 'package:applycamp/data/model/program_search_models/cities.dart';
import 'package:applycamp/data/model/program_search_models/countries.dart';
import 'package:applycamp/data/model/program_search_models/schools.dart';
import 'package:applycamp/data/model/program_search_models/study_fields.dart';
import 'package:flutter/material.dart';

abstract class SearchDataSource {
  Future<List<City>> getAllCities();
  Future<List<School>> getAllSchools();
  Future<List<StudyField>> getAllStudyFields();
}

class SearchDataSourceImpl implements SearchDataSource {
  final PortalDioConsumer dioConsumer;

  SearchDataSourceImpl(this.dioConsumer);

  @override
  Future<List<City>> getAllCities() async {
    final response = await dioConsumer.get(PortalRemoteConstants.getAllCities);

    // here we get the cities response as countries model which contain their cities
    final List countriesWithCities = [];
    (response.data['countries'] as List).forEach((element) {
      countriesWithCities.add(Country.fromJson(element));
    });

    // we collect the cities from countries list into another list
    final List<City> cities = [];
    countriesWithCities.forEach((element) {
      (element.cities as List).forEach((city) {
        cities.add(city);
      });
    });

    return cities;
  }

  // این موقته و هنوز اندپویت اصلی داده نشده
  @override
  Future<List<School>> getAllSchools() async {
    final response =
        await dioConsumer.get(PortalRemoteConstants.getProgramSearchFields);

    final List<School> schoolsList = [];
    (response.data["schools"] as List).forEach((element) {
      schoolsList.add(School.fromJson(element));
    });
    debugPrint(schoolsList.length.toString());
    return schoolsList;
  }

  @override
  Future<List<StudyField>> getAllStudyFields() async {
    final response =
        await dioConsumer.get(PortalRemoteConstants.getAllStudyFields);

    final List<StudyField> studyFields = [];
    (response.data["studyFields"] as List).forEach((element) {
      studyFields.add(StudyField.fromJson(element));
    });

    return studyFields;
  }
}

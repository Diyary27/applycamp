import 'package:applycamp/data/model/program_search_models/city.dart';
import 'package:applycamp/data/model/program_search_models/school.dart';
import 'package:applycamp/ui/search/bloc/search_bloc.dart';
import 'package:applycamp/ui/universities/university_list_vertical.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UniversityListPage extends StatelessWidget {
  const UniversityListPage(
      {super.key, required this.schools, required this.cities});

  final List<School> schools;
  final List<City> cities;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          foregroundColor: Colors.white,
          child: const Icon(Icons.arrow_back),
          onPressed: () {
            context.read<SearchBloc>().add(SearchPageStarted());
          }),
      body: UniversityListVertical(schools: schools, cities: cities),
    );
  }
}

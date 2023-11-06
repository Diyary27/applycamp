import 'package:applycamp/ui/universities/bloc/universities_bloc.dart';
import 'package:applycamp/ui/universities/university_list_vertical.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UniversitiesListPage extends StatelessWidget {
  const UniversitiesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Universities'),
        centerTitle: false,
      ),
      body: BlocProvider(
        create: (context) => UniversitiesBloc()..add(UniversitiesStarted()),
        child: BlocBuilder<UniversitiesBloc, UniversitiesState>(
          builder: (context, state) {
            if (state is UniversitiesInitial) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is UniversitiesSuccess) {
              return UniversityListVertical(
                  schools: state.schools, cities: state.cities);
            } else if (state is UniversitiesError) {
              return const Text('Error');
            } else {
              return Text(state.toString());
            }
          },
        ),
      ),
    );
  }
}

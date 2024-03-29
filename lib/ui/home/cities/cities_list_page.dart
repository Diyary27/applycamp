import 'package:applycamp/ui/home/cities/bloc/cities_bloc.dart';
import 'package:applycamp/ui/search/university_list_page.dart';
import 'package:applycamp/ui/universities/university_list_vertical.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CitiesListPage extends StatelessWidget {
  CitiesListPage({super.key, this.cityId});

  final int? cityId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cities List'),
        centerTitle: false,
      ),
      body: BlocProvider(
        create: (context) {
          if (cityId != null) {
            return CitiesBloc()..add(CityClicked(cityId!));
          } else {
            return CitiesBloc()..add(CitiesStarted());
          }
        },
        child: BlocBuilder<CitiesBloc, CitiesState>(
          builder: (context, state) {
            if (state is CitiesInitial) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CitiesSuccess) {
              return GridView.builder(
                padding: const EdgeInsets.fromLTRB(6, 10, 6, 10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: state.cities.length,
                itemBuilder: (context, index) {
                  final city = state.cities[index];
                  return GestureDetector(
                    onTap: () {
                      context.read<CitiesBloc>().add(CityClicked(city.id!));
                    },
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      width: 165,
                      height: 220,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          color: Theme.of(context).colorScheme.primary,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                              Text(
                                city.title!,
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            } else if (state is CitySchoolsSuccess) {
              return UniversityListVertical(
                  schools: state.schools, cities: state.cities);
            } else if (state is CitiesError) {
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

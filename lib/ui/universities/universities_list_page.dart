import 'package:applycamp/data/model/program_search_models/school.dart';
import 'package:applycamp/ui/universities/bloc/universities_bloc.dart';
import 'package:applycamp/ui/universities/universities_list.dart';
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
              return Center(child: CircularProgressIndicator());
            } else if (state is UniversitiesSuccess) {
              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: state.schools.length,
                itemBuilder: (context, index) {
                  final school = state.schools[index];
                  final cityName = state.cities
                      .firstWhere((e) => e.id == school.cityId)
                      .title;
                  return Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          width: MediaQuery.of(context).size.width,
                          height: 150,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              "assets/img/bau.jpg",
                              fit: BoxFit.cover,
                            ),
                            // Image.network("http://portalapi.applycamp.com/storage/" +
                            // school.image!.realPath.toString()),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          width: MediaQuery.of(context).size.width,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.4),
                          ),
                        ),
                        Positioned(
                          top: 14,
                          left: 17,
                          child: Icon(
                            Icons.favorite_border,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                        Positioned(
                          right: 14,
                          top: 10,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  school.sector,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(color: Colors.white),
                                ),
                              ),
                              SizedBox(height: 2),
                              Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  'Popular',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 35,
                          left: 14,
                          child: Column(
                            children: [
                              SizedBox(
                                width: 115,
                                child: Text(
                                  school.title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(color: Colors.white),
                                  overflow: TextOverflow.clip,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          left: 14,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                              Text(
                                cityName,
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            } else if (state is UniversitiesError) {
              return Text('Error');
            } else {
              return Text(state.toString());
            }
          },
        ),
      ),
    );
  }
}

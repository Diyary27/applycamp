import 'package:applycamp/data/model/program_search_models/city.dart';
import 'package:applycamp/data/model/program_search_models/school.dart';
import 'package:applycamp/ui/home/cities/bloc/cities_bloc.dart';
import 'package:applycamp/ui/universities/bloc/universities_bloc.dart';
import 'package:applycamp/ui/universities/universities_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UniversitiesList extends StatelessWidget {
  const UniversitiesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UniversitiesBloc()..add(UniversitiesStarted()),
      child: Container(
        height: 260,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 8, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Universities',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 18),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => UniversitiesListPage()));
                    },
                    child: Text(
                      'All',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<UniversitiesBloc, UniversitiesState>(
                builder: (context, state) {
                  if (state is UniversitiesInitial) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is UniversitiesSuccess) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        final school = state.schools[index];
                        final cityName = state.cities
                            .firstWhere((e) => e.id == school.cityId)
                            .title;
                        return Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              width: 165,
                              height: 220,
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
                              width: 165,
                              height: 220,
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
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                  ),
                                  Text(
                                    cityName,
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
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
            )
          ],
        ),
      ),
    );
  }
}

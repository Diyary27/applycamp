import 'package:applycamp/ui/home/cities/bloc/cities_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CitiesListPage extends StatelessWidget {
  const CitiesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cities List'),
        centerTitle: false,
      ),
      body: BlocProvider(
        create: (context) => CitiesBloc()..add(CitiesStarted()),
        child: BlocBuilder<CitiesBloc, CitiesState>(
          builder: (context, state) {
            if (state is CitiesInitial) {
              return Center(child: CircularProgressIndicator());
            } else if (state is CitiesSuccess) {
              return GridView.builder(
                padding: EdgeInsets.fromLTRB(6, 10, 6, 10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: state.cities.length,
                itemBuilder: (context, index) {
                  final city = state.cities[index];
                  return Center(
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          width: 180,
                          height: 220,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              "assets/img/bau.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          width: 180,
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
                                city.title,
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
            } else if (state is CitiesError) {
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

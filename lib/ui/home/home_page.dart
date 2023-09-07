import 'package:applycamp/ui/components/app_bar.dart';
import 'package:applycamp/ui/components/drawer.dart';
import 'package:applycamp/ui/home/banner_slider.dart';
import 'package:applycamp/ui/home/categories/categories_list.dart';
import 'package:applycamp/ui/home/cities/bloc/cities_bloc.dart';
import 'package:applycamp/ui/home/cities/cities_list_page.dart';
import 'package:applycamp/ui/home/home_page_utils_list.dart';
import 'package:applycamp/ui/universities/universities_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        drawer: AppDrawer(),
        body: SafeArea(
          child: ListView.builder(
            itemCount: 8,
            itemBuilder: (context, index) {
              switch (index) {
                case 0:
                  return BannerSlider();
                case 1:
                  return HomePageUtilsList();
                case 2:
                  return UniversitiesList();
                case 3:
                  return Container(
                    color: Theme.of(context).colorScheme.primary,
                    margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                    height: 100,
                  );
                case 4:
                  return CategoriesList();
                case 5:
                  return _CititesList();
                case 6:
                  return Container();
                case 7:
                  return _ServicesList();
                default:
                  return Container();
              }
            },
          ),
        ));
  }
}

//
//
class _ServicesList extends StatelessWidget {
  const _ServicesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(16, 10, 0, 0),
            child: Text(
              'Our Services',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 18),
            ),
          ),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                scrollDirection: Axis.horizontal,
                itemCount: 8,
                itemBuilder: (context, index) {
                  final List<String> titles = [
                    'School Offer',
                    'Visa Counseling',
                    'Travel Counseling',
                    'Airport Pickup',
                    'Accomodation',
                    'Certified Translation',
                    'Residence Permit',
                    '24/7 Support',
                  ];
                  final List icons = [
                    Icons.school,
                    Icons.verified_user,
                    Icons.directions_bus,
                    Icons.flight,
                    Icons.hotel,
                    Icons.language_outlined,
                    Icons.support_outlined,
                    Icons.support_agent,
                  ];
                  return Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    width: 110,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 251, 251, 251),
                        border: Border.all(width: 0.5, color: Colors.green),
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            icons[index],
                            size: 36,
                            color: Colors.green,
                          ),
                          SizedBox(height: 4),
                          Text(
                            titles[index],
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ]),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

// cities list part

class _CititesList extends StatelessWidget {
  const _CititesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CitiesBloc()..add(CitiesStarted()),
      child: Container(
        height: 220,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 8, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Cities',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 18),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CitiesListPage()));
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
              child: BlocBuilder<CitiesBloc, CitiesState>(
                builder: (context, state) {
                  if (state is CitiesInitial) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is CitiesSuccess) {
                    return ListView.builder(
                      padding: EdgeInsets.fromLTRB(6, 0, 8, 0),
                      itemCount: state.cities.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final city = state.cities[index];
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
                                    city.title,
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
                  } else if (state is CitiesError) {
                    return Text('error');
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

import 'package:applycamp/data/model/program_search_models/city.dart';
import 'package:applycamp/data/model/program_search_models/school.dart';
import 'package:flutter/material.dart';

class UniversityDetailsPage extends StatelessWidget {
  const UniversityDetailsPage(
      {super.key, required this.school, required this.city});

  final School school;
  final City city;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Program Details'),
        centerTitle: false,
      ),
      body: Column(
        children: [
          // top banner
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                    ),
                    // sector
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(2),
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
                        const SizedBox(height: 2),
                        Container(
                          padding: const EdgeInsets.all(2),
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
                  ],
                ),
                // logo
                SizedBox(
                  width: 45,
                  height: 45,
                  child: Image.network(
                      "https://upload.wikimedia.org/wikipedia/en/4/4b/Logo_of_Bah%C3%A7e%C5%9Fehir_University.jpg"),
                ),
                const SizedBox(height: 10),
                Text(
                  school.title.toUpperCase(),
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                ),
                const SizedBox(height: 10),
                // Location
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    Text(
                      city.title!,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),

          // other details under banner
          Expanded(
            child: DefaultTabController(
              length: 5,
              child: Scaffold(
                appBar: const TabBar(
                  isScrollable: true,
                  labelColor: Colors.black,
                  tabs: [
                    Tab(
                      child: Text('University Details'),
                    ),
                    Tab(
                      child: Text('Programs'),
                    ),
                    Tab(
                      child: Text('Admission Requirements'),
                    ),
                    Tab(
                      child: Text('Accomodation'),
                    ),
                    Tab(
                      child: Text('Gallery'),
                    ),
                  ],
                ),
                body: TabBarView(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(12),
                      child: 'schoolrogram.careerPath' != null
                          ? Text('schoolProgram.careerPath.toString()')
                          : Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.info, size: 38),
                                  SizedBox(height: 10),
                                  Text('No Information Found')
                                ],
                              ),
                            ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(12),
                      child: 'schoolProgram.school.aboutSchool' != null
                          ? Text('schoolProgram.school.aboutSchool.toString()')
                          : Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.info, size: 38),
                                  SizedBox(height: 10),
                                  Text('No Information Found')
                                ],
                              ),
                            ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(12),
                      child: 'schoolProgram.admissionRequirements' != null
                          ? Text(
                              'schoolProgram.admissionRequirements.toString()')
                          : Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.info, size: 38),
                                  SizedBox(height: 10),
                                  Text('No Information Found')
                                ],
                              ),
                            ),
                    ),
                    Container(),
                    Container(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

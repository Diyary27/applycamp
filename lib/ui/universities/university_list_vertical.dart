import 'package:applycamp/data/model/program_search_models/city.dart';
import 'package:applycamp/data/model/program_search_models/school.dart';
import 'package:applycamp/ui/universities/university_details.dart';
import 'package:flutter/material.dart';

class UniversityListVertical extends StatelessWidget {
  const UniversityListVertical({
    super.key,
    required this.schools,
    required this.cities,
  });

  final List<School> schools;
  final List<City> cities;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: schools.length,
      itemBuilder: (context, index) {
        final school = schools[index];
        final cityName = cities.firstWhere((e) => e.id == school.cityId).title;
        return Padding(
          padding: const EdgeInsets.all(10),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
                  builder: (context) => UniversityDetailsPage(
                        school: school,
                        city: cities[index],
                      )));
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(8),
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
                        cityName!,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

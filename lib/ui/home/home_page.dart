import 'package:applycamp/ui/app_bar.dart';
import 'package:applycamp/ui/drawer.dart';
import 'package:applycamp/ui/home/banner_slider.dart';
import 'package:applycamp/ui/home/categories_list.dart';
import 'package:applycamp/ui/home/cities_dormitories_list.dart';
import 'package:applycamp/ui/home/home_page_utils_list.dart';
import 'package:applycamp/ui/home/universities_list.dart';
import 'package:flutter/material.dart';

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
                  return CititesDormitories();
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

import 'package:applycamp/ui/universities/universities_list.dart';
import 'package:flutter/material.dart';

class CityDetailsPage extends StatelessWidget {
  const CityDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('City Name'),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // City Wallpaper
            AspectRatio(
              aspectRatio: 2,
              child: Stack(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      "assets/img/slide_1.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Text(
                        'City Name',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .apply(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const UniversitiesList(),
          ],
        ),
      ),
    );
  }
}

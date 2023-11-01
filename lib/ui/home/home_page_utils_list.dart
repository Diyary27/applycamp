import 'package:applycamp/ui/universities/universities_compare/universities_compare_page.dart';
import 'package:flutter/material.dart';

class HomePageUtilsList extends StatelessWidget {
  const HomePageUtilsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: 130,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context, rootNavigator: true).push(
                    MaterialPageRoute(
                        builder: (context) => UniversitiesComparePage()));
              },
              child: Container(
                margin: const EdgeInsets.only(left: 6, right: 6),
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 251, 251, 251),
                    border: Border.all(
                        width: 0.5,
                        color: Theme.of(context).colorScheme.primary),
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.compare_arrows,
                      size: 36,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Compare Universities',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w300,
                          ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context, rootNavigator: true).push(
                    MaterialPageRoute(
                        builder: (context) => UniversitiesComparePage()));
              },
              child: Container(
                margin: const EdgeInsets.only(left: 6, right: 6),
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 251, 251, 251),
                    border: Border.all(
                        width: 0.5,
                        color: Theme.of(context).colorScheme.primary),
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.question_mark,
                      size: 36,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Frequently Asked Questions',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w300,
                          ),
                    )
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

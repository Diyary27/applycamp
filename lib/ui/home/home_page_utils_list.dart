import 'package:applycamp/ui/universities/compare_universities_page.dart';
import 'package:flutter/material.dart';

class HomePageUtilsList extends StatelessWidget {
  const HomePageUtilsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      child: ListView.builder(
          padding: const EdgeInsets.fromLTRB(6, 12, 6, 2),
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final List<String> titles = [
              'Compare Universities',
              'Frequently Asked Questions',
            ];
            final List icons = [
              Icons.compare_arrows,
              Icons.question_mark,
            ];
            final tapCallBacks = [
              () {
                Navigator.of(context, rootNavigator: true).push(
                    MaterialPageRoute(builder: (context) => CompareUnisPage()));
              },
              () {},
            ];
            return GestureDetector(
              onTap: tapCallBacks[index],
              child: Container(
                margin: const EdgeInsets.only(left: 6, right: 6),
                padding: EdgeInsets.all(6),
                width: 125,
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
                      icons[index],
                      size: 36,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    SizedBox(height: 4),
                    Text(
                      titles[index],
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w300,
                          ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}

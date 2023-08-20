import 'package:flutter/material.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 8, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Popular Categories',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 18),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'All',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
                padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                physics: NeverScrollableScrollPhysics(),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    margin: EdgeInsets.all(4),
                    child: Stack(
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Icon(
                              Icons.computer,
                              size: 40,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 20,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 37, 148, 41),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(16),
                                bottomRight: Radius.circular(16),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Computer and IT',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

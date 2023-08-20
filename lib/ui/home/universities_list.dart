import 'package:flutter/material.dart';

class UniversitiesList extends StatelessWidget {
  const UniversitiesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 8, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Popular Universities',
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
            child: ListView.builder(
              padding: EdgeInsets.fromLTRB(6, 0, 8, 0),
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
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
                              'Private',
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
                              'BAHCESEHIR UNIVERSITY',
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
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                          Text(
                            'Istanbul',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

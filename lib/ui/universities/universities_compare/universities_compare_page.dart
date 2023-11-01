import 'dart:ffi';

import 'package:applycamp/ui/universities/bloc/universities_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UniversitiesComparePage extends StatefulWidget {
  const UniversitiesComparePage({super.key});

  @override
  State<UniversitiesComparePage> createState() =>
      _UniversitiesComparePageState();
}

class _UniversitiesComparePageState extends State<UniversitiesComparePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UniversitiesBloc(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text('Compare Universities'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10),
              BlocListener<UniversitiesBloc, UniversitiesState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          width: 185,
                          height: 210,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              "assets/img/bau.jpg",
                              fit: BoxFit.cover,
                            ),
                            // Image.network("http://portalapi.applycamp.com/storage/" +
                            // school.image!.realPath.toString()),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          width: 185,
                          height: 210,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.4),
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
                                  "school.sector",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(color: Colors.white),
                                ),
                              ),
                              SizedBox(height: 2),
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
                                  "school.title",
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
                                "cityName",
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
                    Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          width: 185,
                          height: 210,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              "assets/img/bau.jpg",
                              fit: BoxFit.cover,
                            ),
                            // Image.network("http://portalapi.applycamp.com/storage/" +
                            // school.image!.realPath.toString()),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          width: 185,
                          height: 210,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.4),
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
                                  "school.sector",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(color: Colors.white),
                                ),
                              ),
                              SizedBox(height: 2),
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
                                  "school.title",
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
                                "cityName",
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
                  ],
                ),
              ),
              SizedBox(height: 20),
              BlocBuilder<UniversitiesBloc, UniversitiesState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.only(left: 10, right: 10, bottom: 10),
                        padding: EdgeInsets.only(top: 10, bottom: 20),
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 5,
                              ),
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Type",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("Public"),
                                Text("Private"),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

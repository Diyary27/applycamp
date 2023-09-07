import 'package:applycamp/ui/home/categories/bloc/categories_bloc.dart';
import 'package:applycamp/ui/home/categories/categories_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesBloc()..add(CategoriesStarted()),
      child: Container(
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
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).push(
                          MaterialPageRoute(
                              builder: (context) => CategoriesListPage()));
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
              child: BlocBuilder<CategoriesBloc, CategoriesState>(
                builder: (context, state) {
                  if (state is CategoriesInitial) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is CategoriesSuccess) {
                    return GridView.builder(
                        padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          final studyField = state.studyFields[index];
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
                                      padding: const EdgeInsets.all(15),
                                      child: Text(
                                        studyField.title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium!
                                            .copyWith(color: Colors.white),
                                        textAlign: TextAlign.center,
                                      )),
                                ),
                                // Positioned(
                                //   bottom: 0,
                                //   left: 0,
                                //   right: 0,
                                //   child: Container(
                                //     height: 30,
                                //     decoration: BoxDecoration(
                                //       color: Color.fromARGB(255, 37, 148, 41),
                                //       borderRadius: BorderRadius.only(
                                //         bottomLeft: Radius.circular(16),
                                //         bottomRight: Radius.circular(16),
                                //       ),
                                //     ),
                                //     child: Center(
                                //       child: Text(
                                //         studyField.title,
                                //         style: Theme.of(context)
                                //             .textTheme
                                //             .labelMedium!
                                //             .copyWith(color: Colors.white),
                                //         textAlign: TextAlign.center,
                                //       ),
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          );
                        });
                  } else if (state is CategoriesError) {
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

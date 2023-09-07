import 'package:applycamp/ui/home/categories/bloc/categories_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesListPage extends StatelessWidget {
  const CategoriesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesBloc()..add(CategoriesStarted()),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text('Categories'),
        ),
        body: BlocBuilder<CategoriesBloc, CategoriesState>(
          builder: (context, state) {
            if (state is CategoriesInitial) {
              return Center(child: CircularProgressIndicator());
            } else if (state is CategoriesSuccess) {
              return GridView.builder(
                  padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemCount: state.studyFields.length,
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
      ),
    );
  }
}

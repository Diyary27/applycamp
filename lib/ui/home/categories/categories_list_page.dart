import 'package:applycamp/ui/home/categories/bloc/categories_bloc.dart';
import 'package:applycamp/ui/search/programs_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesListPage extends StatelessWidget {
  CategoriesListPage({super.key, this.studyFieldId});

  final int? studyFieldId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        if (studyFieldId != null) {
          return CategoriesBloc()..add(CategoryClicked(studyFieldId!));
        } else {
          return CategoriesBloc()..add(CategoriesStarted());
        }
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text('Categories'),
        ),
        body: BlocBuilder<CategoriesBloc, CategoriesState>(
          builder: (context, state) {
            if (state is CategoriesInitial) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CategoriesSuccess) {
              return GridView.builder(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemCount: state.studyFields.length,
                  itemBuilder: (context, index) {
                    final studyField = state.studyFields[index];
                    return GestureDetector(
                      onTap: () {
                        context
                            .read<CategoriesBloc>()
                            .add(CategoryClicked(studyField.id));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        margin: const EdgeInsets.all(4),
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
                      ),
                    );
                  });
            } else if (state is CategoryProgramSuccess) {
              return ProgramsListPage(schoolPrograms: state.schoolPrograms);
            } else if (state is CategoriesError) {
              return const Text('error');
            } else {
              return Text(state.toString());
            }
          },
        ),
      ),
    );
  }
}

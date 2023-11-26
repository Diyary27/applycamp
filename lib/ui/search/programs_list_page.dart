import 'package:applycamp/data/model/program_search_models/school_programs.dart';
import 'package:applycamp/ui/search/bloc/search_bloc.dart';
import 'package:applycamp/ui/search/program_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProgramsListPage extends StatelessWidget {
  const ProgramsListPage({super.key, required this.schoolPrograms});

  final SchoolPrograms schoolPrograms;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          foregroundColor: Colors.white,
          child: const Icon(Icons.arrow_back),
          onPressed: () {
            context.read<SearchBloc>().add(SearchPageStarted());
          }),
      body: ProgramsListView(schoolPrograms: schoolPrograms),
    );
  }
}

class ProgramsListView extends StatelessWidget {
  const ProgramsListView({
    super.key,
    required this.schoolPrograms,
  });

  final SchoolPrograms schoolPrograms;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: schoolPrograms.schoolPrograms.length,
        itemBuilder: (context, index) {
          final schoolProgram = schoolPrograms.schoolPrograms[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
                  builder: (context) => ProgramDetails(
                        schoolProgram: schoolProgram,
                      )));
            },
            child: Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      width: 0.5,
                      color: Theme.of(context).colorScheme.primary)),
              child: Row(
                children: [
                  // left part of the container
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            // Image.network(schoolProgram.school.image!.path),
                            SizedBox(
                              width: 45,
                              height: 45,
                              child: Image.network(
                                  "https://upload.wikimedia.org/wikipedia/en/4/4b/Logo_of_Bah%C3%A7e%C5%9Fehir_University.jpg"),
                            ),
                            const SizedBox(width: 4),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  schoolProgram.school!.title,
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                SizedBox(
                                  width: 260,
                                  child: Text(
                                    schoolProgram.program.title,
                                    overflow: TextOverflow.clip,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        //
                        const SizedBox(height: 10),
                        Column(
                          children: [
                            // degree
                            Row(
                              children: [
                                const Icon(
                                  Icons.school,
                                  size: 16,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  schoolProgram.program.degree!.title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(fontSize: 12),
                                ),
                              ],
                            ),
                            // study years
                            Row(
                              children: [
                                const Icon(
                                  Icons.timelapse,
                                  size: 16,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  "Study Years: ${schoolProgram.studyYears}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(fontSize: 12),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.language,
                                  size: 16,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  schoolProgram.program.language!.title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // right part of container - for tuition fees
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${schoolProgram.tuitionFee} ${schoolProgram.currency!.title}',
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.black54,
                                ),
                      ),
                      Text(
                        '${schoolProgram.tuitionFeeDiscounted} ${schoolProgram.currency!.title}',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(color: Colors.green),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        schoolProgram.tuitionUnit!.title,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(color: Colors.green),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}

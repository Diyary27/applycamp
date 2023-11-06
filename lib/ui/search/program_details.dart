import 'package:applycamp/data/model/program_search_models/school_programs.dart';
import 'package:flutter/material.dart';

class ProgramDetails extends StatelessWidget {
  ProgramDetails({super.key, required this.schoolProgram});

  TabController? tabController;
  final SchoolProgram schoolProgram;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        foregroundColor: Colors.white,
        onPressed: () {},
        label: const Text('Apply Now'),
      ),
      appBar: AppBar(
        title: const Text('Program Details'),
        centerTitle: false,
      ),
      body: Column(
        children: [
          // top banner
          Container(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 16),
            color: Theme.of(context).colorScheme.primary,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 55,
                      height: 55,
                      child: Image.network(
                          "https://upload.wikimedia.org/wikipedia/en/4/4b/Logo_of_Bah%C3%A7e%C5%9Fehir_University.jpg"),
                    ),
                    const Icon(Icons.favorite_border, color: Colors.white)
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Text(
                      schoolProgram.school!.title,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Colors.white),
                    ),
                    const SizedBox(width: 10),
                    // sector
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        schoolProgram.school!.sector,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // program name
                SizedBox(
                  width: MediaQuery.of(context).size.width - 12,
                  child: Text(
                    schoolProgram.program.title,
                    overflow: TextOverflow.clip,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: Colors.white),
                  ),
                ),
                Text(
                  schoolProgram.program.speciality.field.title,
                  overflow: TextOverflow.clip,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.white),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.location_pin,
                          size: 18,
                          color: Colors.white,
                        ),
                        Text(
                          schoolProgram.schoolId.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                    // tuition fee
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            width: 0.5,
                            color: Colors.white,
                          )),
                      child: Row(
                        children: [
                          Text(
                            '${schoolProgram.tuitionFeeDiscounted} ${schoolProgram.currency!.title}',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(color: Colors.white),
                          ),
                          Text(
                            " / ${schoolProgram.tuitionUnit!.title}",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          // other details under banner
          Container(
            padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
            color: Colors.grey.shade300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // degree
                    Row(
                      children: [
                        const Icon(
                          Icons.school,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(schoolProgram.program.degree!.title),
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
                        Text("Study Years: ${schoolProgram.studyYears}"),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.language,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(schoolProgram.program.language!.title),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: DefaultTabController(
              length: 3,
              child: Scaffold(
                appBar: const TabBar(
                  isScrollable: true,
                  labelColor: Colors.black,
                  tabs: [
                    Tab(
                      child: Text('Program Details'),
                    ),
                    Tab(
                      child: Text('University Details'),
                    ),
                    Tab(
                      child: Text('Admission Requirements'),
                    ),
                  ],
                ),
                body: TabBarView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: schoolProgram.careerPath != null
                          ? Text(schoolProgram.careerPath.toString())
                          : const Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.info, size: 38),
                                  SizedBox(height: 10),
                                  Text('No Information Found')
                                ],
                              ),
                            ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: schoolProgram.school!.aboutSchool != null
                          ? Text(schoolProgram.school!.aboutSchool.toString())
                          : const Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.info, size: 38),
                                  SizedBox(height: 10),
                                  Text('No Information Found')
                                ],
                              ),
                            ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: schoolProgram.admissionRequirements != null
                          ? Text(schoolProgram.admissionRequirements.toString())
                          : const Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.info, size: 38),
                                  SizedBox(height: 10),
                                  Text('No Information Found')
                                ],
                              ),
                            ),
                    ),
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

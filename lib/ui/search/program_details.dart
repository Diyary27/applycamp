import 'package:applycamp/data/model/program_search_models/school_programs.dart';
import 'package:flutter/material.dart';

class ProgramDetails extends StatelessWidget {
  const ProgramDetails({super.key, required this.schoolProgram});

  final SchoolProgram schoolProgram;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Program Details'),
        centerTitle: false,
      ),
      body: Column(
        children: [
          // top banner
          Container(
            padding: EdgeInsets.fromLTRB(12, 12, 12, 16),
            color: Theme.of(context).colorScheme.primary,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 55,
                      height: 55,
                      child: Image.network(
                          "https://upload.wikimedia.org/wikipedia/en/4/4b/Logo_of_Bah%C3%A7e%C5%9Fehir_University.jpg"),
                    ),
                    Icon(Icons.favorite_border, color: Colors.white)
                  ],
                ),
                SizedBox(height: 24),
                Row(
                  children: [
                    Text(
                      schoolProgram.school.title,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Colors.white),
                    ),
                    SizedBox(width: 10),
                    // sector
                    Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        schoolProgram.school.sector,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                // program name
                SizedBox(
                  width: 300,
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
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
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
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            width: 0.5,
                            color: Colors.white,
                          )),
                      child: Row(
                        children: [
                          Text(
                            schoolProgram.tuitionFeeDiscounted.toString() +
                                ' ' +
                                schoolProgram.currency.title,
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(color: Colors.white),
                          ),
                          Text(
                            " / " + schoolProgram.tuitionUnit.title,
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
            padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
            color: Colors.grey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // degree
                    Row(
                      children: [
                        Icon(
                          Icons.school,
                          size: 16,
                        ),
                        SizedBox(width: 4),
                        Text(schoolProgram.program.degree.title),
                      ],
                    ),
                    // study years
                    Row(
                      children: [
                        Icon(
                          Icons.timelapse,
                          size: 16,
                        ),
                        SizedBox(width: 4),
                        Text("Study Years: " +
                            schoolProgram.studyYears.toString()),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.language,
                          size: 16,
                        ),
                        SizedBox(width: 4),
                        Text(schoolProgram.program.language.title),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          // details tabs
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(schoolProgram.school.aboutSchool.toString()),
          )
        ],
      ),
    );
  }
}

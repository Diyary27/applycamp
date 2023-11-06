import 'package:applycamp/data/model/program_search_models/currency.dart';
import 'package:applycamp/data/model/program_search_models/pagination_info.dart';
import 'package:applycamp/data/model/program_search_models/program.dart';
import 'package:applycamp/data/model/program_search_models/school.dart';
import 'package:applycamp/data/model/program_search_models/tuition_units.dart';

class SchoolPrograms {
  SchoolPrograms({
    required this.paginationInfo,
    required this.schoolPrograms,
  });
  late final PaginationInfo? paginationInfo;
  late final List<SchoolProgram> schoolPrograms;

  SchoolPrograms.fromJson(Map<String, dynamic> json) {
    paginationInfo = PaginationInfo?.fromJson(json['paginationInfo']);
    schoolPrograms = List.from(json['schoolPrograms'])
        .map((e) => SchoolProgram.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['paginationInfo'] = paginationInfo?.toJson();
    data['schoolPrograms'] = schoolPrograms.map((e) => e.toJson()).toList();
    return data;
  }
}

class SchoolProgram {
  SchoolProgram({
    required this.id,
    required this.schoolId,
    required this.programId,
    required this.tuitionUnitId,
    required this.currencyId,
    required this.tuitionFee,
    required this.tuitionFeeDiscounted,
    required this.isScholarship,
    required this.hasDiscount,
    this.depositAmount,
    required this.commission,
    required this.studyYears,
    this.description,
    this.admissionRequirements,
    this.careerPath,
    required this.isActiveInSearch,
    required this.isActiveInNewApps,
    required this.hasArticle,
    required this.createdAt,
    required this.updatedAt,
    required this.school,
    required this.program,
    required this.tuitionUnit,
    required this.currency,
  });
  late final int id;
  late final int schoolId;
  late final int programId;
  late final int tuitionUnitId;
  late final int currencyId;
  late final int tuitionFee;
  late final int tuitionFeeDiscounted;
  late final bool isScholarship;
  late final bool hasDiscount;
  late final int? depositAmount;
  late final double? commission;
  late final int studyYears;
  late final description;
  late final admissionRequirements;
  late final careerPath;
  late final bool isActiveInSearch;
  late final bool isActiveInNewApps;
  late final bool hasArticle;
  late final String createdAt;
  late final String updatedAt;
  late final School? school;
  late final Program program;
  late final TuitionUnit? tuitionUnit;
  late final Currency? currency;

  SchoolProgram.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    schoolId = json['schoolId'];
    programId = json['programId'];
    tuitionUnitId = json['tuitionUnitId'];
    currencyId = json['currencyId'];
    tuitionFee = json['tuitionFee'];
    tuitionFeeDiscounted = json['tuitionFeeDiscounted'];
    isScholarship = json['isScholarship'];
    hasDiscount = json['hasDiscount'];
    depositAmount = null;
    commission = json['commission'].toDouble();
    studyYears = json['studyYears'];
    description = null;
    admissionRequirements = null;
    careerPath = null;
    isActiveInSearch = json['isActiveInSearch'];
    isActiveInNewApps = json['isActiveInNewApps'];
    hasArticle = json['hasArticle'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    school = json['school'] != null ? School.fromJson(json['school']) : null;
    program = Program.fromJson(json['program']);
    tuitionUnit = json['tuitionUnit'] == null
        ? null
        : TuitionUnit.fromJson(json['tuitionUnit']);
    currency =
        json['currency'] == null ? null : Currency.fromJson(json['currency']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['schoolId'] = schoolId;
    data['programId'] = programId;
    data['tuitionUnitId'] = tuitionUnitId;
    data['currencyId'] = currencyId;
    data['tuitionFee'] = tuitionFee;
    data['tuitionFeeDiscounted'] = tuitionFeeDiscounted;
    data['isScholarship'] = isScholarship;
    data['hasDiscount'] = hasDiscount;
    data['depositAmount'] = depositAmount;
    data['commission'] = commission;
    data['studyYears'] = studyYears;
    data['description'] = description;
    data['admissionRequirements'] = admissionRequirements;
    data['careerPath'] = careerPath;
    data['isActiveInSearch'] = isActiveInSearch;
    data['isActiveInNewApps'] = isActiveInNewApps;
    data['hasArticle'] = hasArticle;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['school'] = school?.toJson();
    data['program'] = program.toJson();
    data['tuitionUnit'] = tuitionUnit?.toJson();
    data['currency'] = currency?.toJson();
    return data;
  }
}

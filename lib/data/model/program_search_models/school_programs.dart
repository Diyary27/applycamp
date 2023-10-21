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
    final _data = <String, dynamic>{};
    _data['paginationInfo'] = paginationInfo?.toJson();
    _data['schoolPrograms'] = schoolPrograms.map((e) => e.toJson()).toList();
    return _data;
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
  late final int commission;
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
  late final TuitionUnit tuitionUnit;
  late final Currency currency;

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
    commission = json['commission'];
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
    tuitionUnit = TuitionUnit.fromJson(json['tuitionUnit']);
    currency = Currency.fromJson(json['currency']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['schoolId'] = schoolId;
    _data['programId'] = programId;
    _data['tuitionUnitId'] = tuitionUnitId;
    _data['currencyId'] = currencyId;
    _data['tuitionFee'] = tuitionFee;
    _data['tuitionFeeDiscounted'] = tuitionFeeDiscounted;
    _data['isScholarship'] = isScholarship;
    _data['hasDiscount'] = hasDiscount;
    _data['depositAmount'] = depositAmount;
    _data['commission'] = commission;
    _data['studyYears'] = studyYears;
    _data['description'] = description;
    _data['admissionRequirements'] = admissionRequirements;
    _data['careerPath'] = careerPath;
    _data['isActiveInSearch'] = isActiveInSearch;
    _data['isActiveInNewApps'] = isActiveInNewApps;
    _data['hasArticle'] = hasArticle;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['school'] = school?.toJson();
    _data['program'] = program.toJson();
    _data['tuitionUnit'] = tuitionUnit.toJson();
    _data['currency'] = currency.toJson();
    return _data;
  }
}

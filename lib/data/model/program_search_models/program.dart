import 'package:applycamp/data/model/program_search_models/abilities.dart';
import 'package:applycamp/data/model/program_search_models/degrees.dart';
import 'package:applycamp/data/model/program_search_models/language.dart';
import 'package:applycamp/data/model/program_search_models/specialities.dart';

class Program {
  Program({
    required this.id,
    required this.degreeId,
    required this.specialityId,
    required this.languageId,
    required this.title,
    required this.isActiveInSearch,
    required this.isActiveInNewApps,
    required this.hasArticle,
    required this.can,
    required this.createdAt,
    required this.updatedAt,
    required this.degree,
    required this.speciality,
    required this.language,
  });
  late final int id;
  late final int degreeId;
  late final int specialityId;
  late final int languageId;
  late final String title;
  late final bool isActiveInSearch;
  late final bool isActiveInNewApps;
  late final bool hasArticle;
  late final Can can;
  late final String createdAt;
  late final String updatedAt;
  late final Degree? degree;
  late final Speciality speciality;
  late final Language? language;

  Program.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    degreeId = json['degreeId'];
    specialityId = json['specialityId'];
    languageId = json['languageId'];
    title = json['title'];
    isActiveInSearch = json['isActiveInSearch'];
    isActiveInNewApps = json['isActiveInNewApps'];
    hasArticle = json['hasArticle'];
    can = Can.fromJson(json['can']);
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    degree = json['degree'] == null ? null : Degree.fromJson(json['degree']);
    speciality = Speciality.fromJson(json['speciality']);
    language =
        json['language'] == null ? null : Language.fromJson(json['language']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['degreeId'] = degreeId;
    _data['specialityId'] = specialityId;
    _data['languageId'] = languageId;
    _data['title'] = title;
    _data['isActiveInSearch'] = isActiveInSearch;
    _data['isActiveInNewApps'] = isActiveInNewApps;
    _data['hasArticle'] = hasArticle;
    _data['can'] = can.toJson();
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['degree'] = degree?.toJson();
    _data['speciality'] = speciality.toJson();
    _data['language'] = language?.toJson();
    return _data;
  }
}

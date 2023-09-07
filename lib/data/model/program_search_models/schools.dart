import 'package:applycamp/data/model/program_search_models/abilities.dart';
import 'package:applycamp/data/model/program_search_models/image.dart';

class School {
  School({
    required this.id,
    required this.schoolTypeId,
    required this.cityId,
    required this.title,
    required this.address,
    required this.founded,
    required this.sector,
    required this.studentsCount,
    required this.website,
    required this.isActiveInSearch,
    required this.isActiveInNewApps,
    required this.aboutSchool,
    required this.can,
    required this.createdAt,
    required this.updatedAt,
    required this.image,
  });
  late final int id;
  late final int schoolTypeId;
  late final int cityId;
  late final String title;
  late final String address;
  late final int founded;
  late final String sector;
  late final int studentsCount;
  late final String website;
  late final bool isActiveInSearch;
  late final bool isActiveInNewApps;
  late final String? aboutSchool;
  late final Can can;
  late final String createdAt;
  late final String updatedAt;
  late final Image? image;

  School.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    schoolTypeId = json['schoolTypeId'];
    cityId = json['cityId'];
    title = json['title'];
    address = json['address'];
    founded = json['founded'];
    sector = json['sector'];
    studentsCount = json['studentsCount'];
    website = json['website'];
    isActiveInSearch = json['isActiveInSearch'];
    isActiveInNewApps = json['isActiveInNewApps'];
    aboutSchool = json['aboutSchool'];
    can = Can.fromJson(json['can']);
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    image = Image.fromJson(json['image']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['schoolTypeId'] = schoolTypeId;
    _data['cityId'] = cityId;
    _data['title'] = title;
    _data['address'] = address;
    _data['founded'] = founded;
    _data['sector'] = sector;
    _data['studentsCount'] = studentsCount;
    _data['website'] = website;
    _data['isActiveInSearch'] = isActiveInSearch;
    _data['isActiveInNewApps'] = isActiveInNewApps;
    _data['aboutSchool'] = aboutSchool;
    _data['can'] = can.toJson();
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['image'] = image?.toJson();
    return _data;
  }
}

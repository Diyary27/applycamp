import 'package:applycamp/data/model/file_response.dart';
import 'package:applycamp/data/model/program_search_models/abilities.dart';
import 'package:applycamp/data/model/program_search_models/city.dart';
import 'package:applycamp/data/model/program_search_models/image.dart';
import 'package:applycamp/data/model/program_search_models/school_types.dart';

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
    required this.city,
    required this.type,
    required this.image,
  });

  final int id;
  final int schoolTypeId;
  final int cityId;
  final String title;
  final String address;
  final int founded;
  final String sector;
  final int studentsCount;
  final String website;
  final bool? isActiveInSearch;
  final bool? isActiveInNewApps;
  final String? aboutSchool;
  final Can can;
  final String createdAt;
  final String updatedAt;
  final City? city;
  final SchoolType? type;
  final Image? image;

  factory School.fromJson(Map<String, dynamic> json) {
    return School(
      id: json["id"],
      schoolTypeId: json["schoolTypeId"],
      cityId: json["cityId"],
      title: json["title"],
      address: json["address"],
      founded: json["founded"],
      sector: json["sector"],
      studentsCount: json["studentsCount"],
      website: json["website"],
      isActiveInSearch: json["isActiveInSearch"],
      isActiveInNewApps: json["isActiveInNewApps"],
      aboutSchool: json["aboutSchool"],
      can: Can.fromJson(json["can"]),
      createdAt: json["createdAt"],
      updatedAt: json["updatedAt"],
      city: json["city"] == null ? null : City.fromJson(json["city"]),
      type: json["type"] == null ? null : SchoolType.fromJson(json["type"]),
      image: json["image"] == null ? null : Image.fromJson(json["image"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "schoolTypeId": schoolTypeId,
        "cityId": cityId,
        "title": title,
        "address": address,
        "founded": founded,
        "sector": sector,
        "studentsCount": studentsCount,
        "website": website,
        "isActiveInSearch": isActiveInSearch,
        "isActiveInNewApps": isActiveInNewApps,
        "aboutSchool": aboutSchool,
        "can": can?.toJson(),
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "city": city?.toJson(),
        "type": type?.toJson(),
        "image": image?.toJson(),
      };
}

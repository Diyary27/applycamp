import 'package:applycamp/data/model/program_search_models/abilities.dart';
import 'package:applycamp/data/model/program_search_models/country.dart';

class City {
  City({
    required this.id,
    required this.title,
    required this.countryId,
    required this.can,
    required this.country,
  });

  final int? id;
  final String? title;
  final int? countryId;
  final Can? can;
  final Country? country;

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json["id"],
      title: json["title"],
      countryId: json["countryId"],
      can: json["can"] == null ? null : Can.fromJson(json["can"]),
      country:
          json["country"] == null ? null : Country.fromJson(json["country"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "countryId": countryId,
        "can": can?.toJson(),
        "country": country?.toJson(),
      };
}

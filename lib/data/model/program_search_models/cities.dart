import 'package:applycamp/data/model/program_search_models/abilities.dart';

class City {
  City({
    required this.id,
    required this.title,
    required this.countryId,
    required this.can,
  });
  late final int id;
  late final String title;
  late final int countryId;
  late final Can can;

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    countryId = json['countryId'];
    can = Can.fromJson(json['can']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['countryId'] = countryId;
    _data['can'] = can.toJson();
    return _data;
  }
}

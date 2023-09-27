import 'package:applycamp/data/model/program_search_models/abilities.dart';
import 'package:applycamp/data/model/program_search_models/city.dart';

class Country {
  Country({
    required this.id,
    required this.title,
    required this.order,
    required this.can,
    required this.cities,
  });
  late final int id;
  late final String title;
  late final int order;
  late final Can can;
  late final List<City>? cities;

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    order = json['order'];
    can = Can.fromJson(json['can']);
    cities = json['cities'] != null
        ? List.from(json['cities']).map((e) => City.fromJson(e)).toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['order'] = order;
    _data['can'] = can.toJson();
    _data['cities'] = cities?.map((e) => e.toJson()).toList();
    return _data;
  }
}

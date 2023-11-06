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
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['order'] = order;
    data['can'] = can.toJson();
    data['cities'] = cities?.map((e) => e.toJson()).toList();
    return data;
  }
}

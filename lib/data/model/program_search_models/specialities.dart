import 'package:applycamp/data/model/program_search_models/abilities.dart';

class Specialities {
  Specialities({
    required this.id,
    required this.title,
    this.fieldId,
    required this.can,
  });
  late final int id;
  late final String title;
  late final int? fieldId;
  late final Can can;

  Specialities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    fieldId = null;
    can = Can.fromJson(json['can']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['fieldId'] = fieldId;
    _data['can'] = can.toJson();
    return _data;
  }
}

class Speciality {
  Speciality({
    required this.id,
    required this.title,
    required this.fieldId,
    required this.can,
    required this.field,
  });
  late final int id;
  late final String title;
  late final int fieldId;
  late final Can can;
  late final Field field;

  Speciality.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    fieldId = json['fieldId'];
    can = Can.fromJson(json['can']);
    field = Field.fromJson(json['field']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['fieldId'] = fieldId;
    _data['can'] = can.toJson();
    _data['field'] = field.toJson();
    return _data;
  }
}

class Field {
  Field({
    required this.id,
    required this.title,
    required this.can,
  });
  late final int id;
  late final String title;
  late final Can can;

  Field.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    can = Can.fromJson(json['can']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['can'] = can.toJson();
    return _data;
  }
}

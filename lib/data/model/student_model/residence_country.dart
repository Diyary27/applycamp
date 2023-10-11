class ResidenceCountry {
  ResidenceCountry({
    required this.id,
    required this.name,
    required this.fullName,
    required this.continentCode,
    required this.code,
    required this.iso3,
    required this.number,
  });
  late final int id;
  late final String name;
  late final String fullName;
  late final String continentCode;
  late final String code;
  late final String iso3;
  late final String number;

  ResidenceCountry.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    fullName = json['fullName'];
    continentCode = json['continentCode'];
    code = json['code'];
    iso3 = json['iso3'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['fullName'] = fullName;
    _data['continentCode'] = continentCode;
    _data['code'] = code;
    _data['iso3'] = iso3;
    _data['number'] = number;
    return _data;
  }
}

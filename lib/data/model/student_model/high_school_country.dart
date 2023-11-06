class HighSchoolCountry {
  HighSchoolCountry({
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

  HighSchoolCountry.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    fullName = json['fullName'];
    continentCode = json['continentCode'];
    code = json['code'];
    iso3 = json['iso3'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['fullName'] = fullName;
    data['continentCode'] = continentCode;
    data['code'] = code;
    data['iso3'] = iso3;
    data['number'] = number;
    return data;
  }
}

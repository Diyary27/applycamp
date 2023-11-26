class ProfileFields {
  ProfileFields({
    this.password,
    this.name,
    this.phone,
    this.organization,
    this.profileImage,
  });
  late final String? password;
  late final String? name;
  late final String? phone;
  late final String? organization;
  late final UploadedImage? profileImage;

  ProfileFields.fromJson(Map<String, dynamic> json) {
    password = json['password'];
    name = json['name'];
    phone = json['phone'];
    organization = json['organization'];
    profileImage = UploadedImage.fromJson(json['profileImage']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['password'] = password;
    _data['name'] = name;
    _data['phone'] = phone;
    _data['organization'] = organization;
    _data['profileImage'] = profileImage?.toJson();
    return _data;
  }
}

class UploadedImage {
  UploadedImage({
    required this.id,
    required this.uuid,
  });
  late final int id;
  late final String uuid;

  UploadedImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['uuid'] = uuid;
    return _data;
  }
}

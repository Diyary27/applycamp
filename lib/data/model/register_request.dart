class RegisterRequest {
  RegisterRequest({
    required this.email,
    required this.password,
    required this.name,
    required this.organization,
    required this.phone,
    required this.profileImage,
  });
  late final String email;
  late final String password;
  late final String name;
  late final String organization;
  late final String phone;
  late final ProfileImage profileImage;

  RegisterRequest.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    name = json['name'];
    organization = json['organization'];
    phone = json['phone'];
    profileImage = ProfileImage.fromJson(json['profileImage']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['email'] = email;
    _data['password'] = password;
    _data['name'] = name;
    _data['organization'] = organization;
    _data['phone'] = phone;
    _data['profileImage'] = profileImage.toJson();
    return _data;
  }
}

class ProfileImage {
  ProfileImage({
    required this.id,
    required this.uuid,
  });
  late final int id;
  late final String uuid;

  ProfileImage.fromJson(Map<String, dynamic> json) {
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

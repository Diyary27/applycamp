import 'package:applycamp/data/model/login_info_model.dart';
import 'package:applycamp/data/model/student_model/student_model.dart';

class StudentAuthResponse {
  StudentAuthResponse({
    required this.student,
    required this.loginInfo,
    required this.message,
  });
  late final Student student;
  late final LoginInfo loginInfo;
  late final String message;

  StudentAuthResponse.fromJson(Map<String, dynamic> json) {
    student = Student.fromJson(json['student']);
    loginInfo = LoginInfo.fromJson(json['loginInfo']);
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['student'] = student.toJson();
    _data['loginInfo'] = loginInfo.toJson();
    _data['message'] = message;
    return _data;
  }
}

class ApplicationCan {
  ApplicationCan({
    required this.update,
    required this.changeDocuments,
    required this.changeStatus,
    required this.assign,
    required this.sendEmail,
    required this.generatePreAcceptanceLetter,
  });
  late final bool update;
  late final bool changeDocuments;
  late final bool changeStatus;
  late final bool assign;
  late final bool sendEmail;
  late final bool generatePreAcceptanceLetter;

  ApplicationCan.fromJson(Map<String, dynamic> json) {
    update = json['update'];
    changeDocuments = json['changeDocuments'];
    changeStatus = json['changeStatus'];
    assign = json['assign'];
    sendEmail = json['sendEmail'];
    generatePreAcceptanceLetter = json['generatePreAcceptanceLetter'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['update'] = update;
    data['changeDocuments'] = changeDocuments;
    data['changeStatus'] = changeStatus;
    data['assign'] = assign;
    data['sendEmail'] = sendEmail;
    data['generatePreAcceptanceLetter'] = generatePreAcceptanceLetter;
    return data;
  }
}

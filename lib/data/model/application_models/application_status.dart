class ApplicationStatus {
  ApplicationStatus({
    required this.id,
    required this.title,
    required this.order,
    required this.bgColor,
    required this.textColor,
    required this.progress,
    required this.isError,
  });
  late final int id;
  late final String title;
  late final int order;
  late final String bgColor;
  late final String textColor;
  late final int progress;
  late final bool isError;

  ApplicationStatus.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    order = json['order'];
    bgColor = json['bgColor'];
    textColor = json['textColor'];
    progress = json['progress'];
    isError = json['isError'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['order'] = order;
    data['bgColor'] = bgColor;
    data['textColor'] = textColor;
    data['progress'] = progress;
    data['isError'] = isError;
    return data;
  }
}

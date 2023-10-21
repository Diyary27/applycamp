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
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['order'] = order;
    _data['bgColor'] = bgColor;
    _data['textColor'] = textColor;
    _data['progress'] = progress;
    _data['isError'] = isError;
    return _data;
  }
}

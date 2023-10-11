class AvailableNextStatuses {
/*
{
  "id": 11,
  "title": "تکمیل شده",
  "order": 120,
  "bgColor": "#bac3d0",
  "textColor": "#ffffff",
  "progress": 100,
  "isError": false
} 
*/

  late final int? id;
  late final String? title;
  late final int? order;
  late final String? bgColor;
  late final String? textColor;
  late final int? progress;
  late final bool? isError;

  AvailableNextStatuses({
    this.id,
    this.title,
    this.order,
    this.bgColor,
    this.textColor,
    this.progress,
    this.isError,
  });
  AvailableNextStatuses.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    title = json['title']?.toString();
    order = json['order']?.toInt();
    bgColor = json['bgColor']?.toString();
    textColor = json['textColor']?.toString();
    progress = json['progress']?.toInt();
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

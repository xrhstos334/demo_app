

class NotificationModel{
  String? title;
  String? body;
  String? date;
  bool? isRead;
  bool? isArchived;

  NotificationModel({
    this.title,
    this.body,
    this.date,
    this.isRead = false,
    this.isArchived = false,
  });

  NotificationModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    body = json['body'];
    date = json['date'];
    isRead = json['isRead'] ?? false;
    isArchived = json['isArchived'] ?? false;
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'body': body,
      'date': date,
      'isRead': isRead,
      'isArchived': isArchived,
    };
  }
}
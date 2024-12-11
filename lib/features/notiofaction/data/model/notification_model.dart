class NotificationsModel {
  bool? status;
  int? statusCode;
  Data? data;
  String? message;

  NotificationsModel({this.status, this.statusCode, this.data, this.message});

  NotificationsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['status_code'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }
}

class Data {
  List<DataNotifications>? data;
  Links? links;
  Meta? meta;

  Data({this.data, this.links, this.meta});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DataNotifications>[];
      json['data'].forEach((v) {
        data!.add(DataNotifications.fromJson(v));
      });
    }
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }
}

class DataNotifications {
  int? id;
  String? title;
  String? message;
  String? notificationType;
  String? params;
  String? icon;
  String? createdAt;

  DataNotifications(
      {this.id,
      this.title,
      this.message,
      this.notificationType,
      this.params,
      this.icon,
      this.createdAt});

  DataNotifications.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    message = json['message'];
    notificationType = json['notification_type'];
    params = json['params'];
    icon = json['icon'];
    createdAt = json['created_at'];
  }
}

class Links {
  String? first;
  String? last;
  String? prev;
  String? next;

  Links({this.first, this.last, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }
}

class Meta {
  int? currentPage;
  int? from;
  int? lastPage;
  List<Links>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  Meta(
      {this.currentPage,
      this.from,
      this.lastPage,
      this.links,
      this.path,
      this.perPage,
      this.to,
      this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(Links.fromJson(v));
      });
    }
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }
}

class Linksa {
  String? url;
  String? label;
  bool? active;

  Linksa({this.url, this.label, this.active});

  Linksa.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }
}

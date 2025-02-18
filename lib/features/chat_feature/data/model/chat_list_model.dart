class ChatListModel {
  bool? status;
  int? statusCode;
  Data? data;
  String? message;

  ChatListModel({this.status, this.statusCode, this.data, this.message});

  ChatListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['status_code'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }
}

class Data {
  List<Dataa>? data;
  Links? links;
  Meta? meta;

  Data({this.data, this.links, this.meta});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Dataa>[];
      json['data'].forEach((v) {
        data!.add(Dataa.fromJson(v));
      });
    }
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }
}

class Dataa {
  int? id;
  Customer? customer;
  Customer? driver;
  int? orderId;
  int? orderNum;
  bool? canSendMessages;
  String? createdAt;
  LastMessage? lastMessage;
  bool? unreadMessagesCustomer;
  bool? unreadMessagesDriver;

  Dataa(
      {this.id,
      this.customer,
      this.driver,
      this.orderId,
      this.orderNum,
      this.canSendMessages,
      this.createdAt,
      this.lastMessage,
      this.unreadMessagesCustomer,
      this.unreadMessagesDriver});

  Dataa.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customer =
        json['customer'] != null ? Customer.fromJson(json['customer']) : null;
    driver = json['driver'] != null ? Customer.fromJson(json['driver']) : null;
    orderId = json['order_id'];
    orderNum = json['order_num'];
    canSendMessages = json['can_send_messages'];
    createdAt = json['created_at'];
    lastMessage = json['last_message'] != null
        ? LastMessage.fromJson(json['last_message'])
        : null;
    unreadMessagesCustomer = json['unread_messages_customer'];
    unreadMessagesDriver = json['unread_messages_driver'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (customer != null) {
      data['customer'] = customer!.toJson();
    }
    if (driver != null) {
      data['driver'] = driver!.toJson();
    }
    data['order_id'] = orderId;
    data['order_num'] = orderNum;
    data['can_send_messages'] = canSendMessages;
    data['created_at'] = createdAt;
    if (lastMessage != null) {
      data['last_message'] = lastMessage!.toJson();
    }
    data['unread_messages_customer'] = unreadMessagesCustomer;
    data['unread_messages_driver'] = unreadMessagesDriver;
    return data;
  }
}

class Customer {
  int? id;
  String? name;
  String? image;

  Customer({this.id, this.name, this.image});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    return data;
  }
}

class LastMessage {
  int? id;
  String? message;

  String? createdAt;
  String? createdAtFormat;
  Customer? sender;

  LastMessage(
      {this.id,
      this.message,
      this.createdAt,
      this.createdAtFormat,
      this.sender});

  LastMessage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    message = json['message'];

    createdAt = json['created_at'];
    createdAtFormat = json['created_at_format'];
    sender = json['sender'] != null ? Customer.fromJson(json['sender']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['message'] = message;

    data['created_at'] = createdAt;
    data['created_at_format'] = createdAtFormat;
    if (sender != null) {
      data['sender'] = sender!.toJson();
    }
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first'] = first;
    data['last'] = last;
    data['prev'] = prev;
    data['next'] = next;
    return data;
  }
}

class Meta {
  int? currentPage;
  int? from;
  int? lastPage;
  List<Linkas>? links;
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
      links = <Linkas>[];
      json['links'].forEach((v) {
        links!.add(Linkas.fromJson(v));
      });
    }
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }
}

class Linkas {
  String? url;
  String? label;
  bool? active;

  Linkas({this.url, this.label, this.active});

  Linkas.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['label'] = label;
    data['active'] = active;
    return data;
  }
}

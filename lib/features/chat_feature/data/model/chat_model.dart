
class ChatModel {
  bool? status;
  int? statusCode;
  Data? data;
  String? message;

  ChatModel({this.status, this.statusCode, this.data, this.message});

  ChatModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['status_code'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }
}

class Data {
  ChatData? chatData;
  Messages? messages;

  Data({this.chatData, this.messages});

  Data.fromJson(Map<String, dynamic> json) {
    chatData =
        json['chat_data'] != null ? ChatData.fromJson(json['chat_data']) : null;
    messages =
        json['messages'] != null ? Messages.fromJson(json['messages']) : null;
  }
}

class ChatData {
  int? id;
  Customer? customer;
  // Driver? driver;
  int? orderId;
  String? orderNum;
  bool? canSendMessages;
  String? createdAt;
  LastMessage? lastMessage;
  bool? unreadMessagesCustomer;
  bool? unreadMessagesDriver;

  ChatData(
      {this.id,
      this.customer,
      // this.driver,
      this.orderId,
      this.orderNum,
      this.canSendMessages,
      this.createdAt,
      this.lastMessage,
      this.unreadMessagesCustomer,
      this.unreadMessagesDriver});

  ChatData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customer =
        json['customer'] != null ? Customer.fromJson(json['customer']) : null;
    // driver = json['driver'] != null ? Driver.fromJson(json['driver']) : null;
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
    // if (driver != null) {
    //   data['driver'] = driver!.toJson();
    // }
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
  String? attach;
  String? createdAt;
  String? createdAtFormat;
  Customer? sender;

  LastMessage(
      {this.id,
      this.message,
      this.attach,
      this.createdAt,
      this.createdAtFormat,
      this.sender});

  LastMessage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    message = json['message'];
    attach = json['attach'];
    createdAt = json['created_at'];
    createdAtFormat = json['created_at_format'];
    sender = json['sender'] != null ? Customer.fromJson(json['sender']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['message'] = message;
    data['attach'] = attach;
    data['created_at'] = createdAt;
    data['created_at_format'] = createdAtFormat;
    if (sender != null) {
      data['sender'] = sender!.toJson();
    }
    return data;
  }
}

class Messages {
  int? currentPage;
  List<Message>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  // List<Links>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  Messages(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      // this.links,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});

  Messages.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Message>[];
      json['data'].forEach((v) {
        data!.add(Message.fromJson(v));
      });
    }
    data!.sort((a, b) => a.createdAt!.compareTo(b.createdAt!));

    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    // if (json['links'] != null) {
    //   links = <Links>[];
    //   json['links'].forEach((v) {
    //     links!.add(Links.fromJson(v));
    //   });
    // }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }
}

class Message {
  int? id;
  int? chatId;
  int? userId;
  String? message;
  String? attach;
  String? createdAt;
  String? updatedAt;

  Message(
      {this.id,
      this.chatId,
      this.userId,
      this.message,
      this.attach,
      this.createdAt,
      this.updatedAt});

  Message.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    chatId = json['chat_id'];
    userId = json['user_id'];
    message = json['message'];
    attach = json['attach'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['chat_id'] = chatId;
    data['user_id'] = userId;
    data['message'] = message;
    data['attach'] = attach;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

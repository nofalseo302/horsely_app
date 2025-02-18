import 'chats.dart';

class Data {
  bool? unreadMessages;
  Chats? chats;
  int? total;

  Data({this.unreadMessages, this.chats, this.total});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        unreadMessages: json['unread_messages'] as bool?,
        chats: json['chats'] == null
            ? null
            : Chats.fromJson(json['chats'] as Map<String, dynamic>),
        total: json['total'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'unread_messages': unreadMessages,
        'chats': chats?.toJson(),
        'total': total,
      };
}

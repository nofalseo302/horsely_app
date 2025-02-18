import 'last_message.dart';
import 'user.dart';

class ChatData {
  int? id;
  User? user;
  DateTime? createdAt;
  LastMessage? lastMessage;
  bool? unreadMessages;

  ChatData({
    this.id,
    this.user,
    this.createdAt,
    this.lastMessage,
    this.unreadMessages,
  });

  factory ChatData.fromJson(Map<String, dynamic> json) => ChatData(
        id: json['id'] as int?,
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        lastMessage: json['last_message'] == null
            ? null
            : LastMessage.fromJson(
                json['last_message'] as Map<String, dynamic>),
        unreadMessages: json['unread_messages'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user': user?.toJson(),
        'created_at': createdAt?.toIso8601String(),
        'last_message': lastMessage?.toJson(),
        'unread_messages': unreadMessages,
      };
}

import 'chat_data.dart';
import 'messages.dart';

class Data {
  ChatData? chatData;
  Messages? messages;

  Data({this.chatData, this.messages});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        chatData: json['chat_data'] == null
            ? null
            : ChatData.fromJson(json['chat_data'] as Map<String, dynamic>),
        messages: json['messages'] == null
            ? null
            : Messages.fromJson(json['messages'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'chat_data': chatData?.toJson(),
        'messages': messages?.toJson(),
      };
}

import 'sender.dart';

class LastMessage {
  int? id;
  String? message;
  String? attach;
  DateTime? createdAt;
  String? createdAtFormat;
  Sender? sender;

  LastMessage({
    this.id,
    this.message,
    this.attach,
    this.createdAt,
    this.createdAtFormat,
    this.sender,
  });

  factory LastMessage.fromJson(Map<String, dynamic> json) => LastMessage(
        id: json['id'] as int?,
        message: json['message'] as String?,
        attach: json['attach'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        createdAtFormat: json['created_at_format'] as String?,
        sender: json['sender'] == null
            ? null
            : Sender.fromJson(json['sender'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'message': message,
        'attach': attach,
        'created_at': createdAt?.toIso8601String(),
        'created_at_format': createdAtFormat,
        'sender': sender?.toJson(),
      };
}

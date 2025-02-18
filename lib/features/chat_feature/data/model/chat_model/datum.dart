class Datum {
  int? id;
  int? chatId;
  int? userId;
  String? message;
  String? attach;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    this.id,
    this.chatId,
    this.userId,
    this.message,
    this.attach,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int?,
        chatId: json['chat_id'] as int?,
        userId: json['user_id'] as int?,
        message: json['message'] as String?,
        attach: json['attach'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'chat_id': chatId,
        'user_id': userId,
        'message': message,
        'attach': attach,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}

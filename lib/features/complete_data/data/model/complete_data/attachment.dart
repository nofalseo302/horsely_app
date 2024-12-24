class Attachment {
  int? id;
  String? path;

  Attachment({this.id, this.path});

  factory Attachment.fromJson(Map<String, dynamic> json) => Attachment(
        id: json['id'] as int?,
        path: json['path'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'path': path,
      };
}

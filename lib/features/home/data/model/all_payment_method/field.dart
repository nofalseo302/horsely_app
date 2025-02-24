class Field {
  int? id;
  String? name;
  String? title;
  dynamic value;

  Field({this.id, this.name, this.title, this.value});

  factory Field.fromJson(Map<String, dynamic> json) => Field(
        id: json['id'] as int?,
        name: json['name'] as String?,
        title: json['title'] as String?,
        value: json['value'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'title': title,
        'value': value,
      };
}

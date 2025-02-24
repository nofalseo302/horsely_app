import 'field.dart';

class Datum {
  int? id;
  String? name;
  String? notes;
  String? image;
  bool? isDefault;
  List<Field>? fields;

  Datum({
    this.id,
    this.name,
    this.notes,
    this.image,
    this.isDefault,
    this.fields,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int?,
        name: json['name'] as String?,
        notes: json['notes'] as String?,
        image: json['image'] as String?,
        isDefault: json['is_default'] as bool?,
        fields: (json['fields'] as List<dynamic>?)
            ?.map((e) => Field.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'notes': notes,
        'image': image,
        'is_default': isDefault,
        'fields': fields?.map((e) => e.toJson()).toList(),
      };
}

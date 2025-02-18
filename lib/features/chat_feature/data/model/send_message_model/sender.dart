class Sender {
  int? id;
  String? name;
  String? image;

  Sender({this.id, this.name, this.image});

  factory Sender.fromJson(Map<String, dynamic> json) => Sender(
        id: json['id'] as int?,
        name: json['name'] as String?,
        image: json['image'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
      };
}

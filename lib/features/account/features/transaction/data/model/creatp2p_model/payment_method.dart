class PaymentMethod {
  int? id;
  String? name;

  PaymentMethod({this.id, this.name});

  factory PaymentMethod.fromJson(Map<String, dynamic> json) => PaymentMethod(
        id: json['id'] as int?,
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}

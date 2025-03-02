class User {
  int? id;
  String? name;
  String? image;
  int? orderCount;
  int? completedOrderCount;
  String? rating;

  User({
    this.id,
    this.name,
    this.image,
    this.orderCount,
    this.rating,
    this.completedOrderCount,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as int?,
        name: json['name'] as String?,
        image: json['image'] as String?,
        orderCount: json['order_count'] as int?,
        rating: json['rating'] == null
            ? null
            : json['rating'].toString() as String?,
        completedOrderCount: json['completed_order_count'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'order_count': orderCount,
        'completed_order_count': completedOrderCount,
      };
}

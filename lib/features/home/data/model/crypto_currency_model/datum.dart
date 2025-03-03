class Datum {
  int? id;
  String? name;
  String? symbol;
  String? net;
  String? image;

  Datum({this.id, this.name, this.symbol, this.image, this.net});

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int?,
        name: json['name'] as String?,
        symbol: json['symbol'] as String?,
        image: json['image'] as String?,
        net: json['network_type'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'symbol': symbol,
        'image': image,
      };
}

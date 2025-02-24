class Datum {
  int? id;
  String? name;
  String? symbol;

  Datum({this.id, this.name, this.symbol});

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int?,
        name: json['name'] as String?,
        symbol: json['symbol'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'symbol': symbol,
      };
}

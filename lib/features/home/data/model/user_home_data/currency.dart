class Currency {
  int? id;
  String? name;
  String? symbol;

  Currency({this.id, this.name, this.symbol});

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
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

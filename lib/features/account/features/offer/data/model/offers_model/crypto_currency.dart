class CryptoCurrency {
  int? id;
  String? name;
  String? symbol;

  CryptoCurrency({this.id, this.name, this.symbol});

  factory CryptoCurrency.fromJson(Map<String, dynamic> json) {
    return CryptoCurrency(
      id: json['id'] as int?,
      name: json['name'] as String?,
      symbol: json['symbol'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'symbol': symbol,
      };
}

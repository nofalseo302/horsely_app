class Datum {
  int? id;
  String? address;
  String? privateKey;
  int? balance;

  Datum({this.id, this.address, this.privateKey, this.balance});

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int?,
        address: json['address'] as String?,
        privateKey: json['private_key'] as String?,
        balance: json['balance'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'address': address,
        'private_key': privateKey,
        'balance': balance,
      };
}

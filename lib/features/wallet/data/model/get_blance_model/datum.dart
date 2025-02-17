import 'crypto_currency.dart';

class Datum {
  int? id;
  String? address;
  String? privateKey;
  int? balance;
  CryptoCurrency? cryptoCurrency;

  Datum({
    this.id,
    this.address,
    this.privateKey,
    this.balance,
    this.cryptoCurrency,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int?,
        address: json['address'] as String?,
        privateKey: json['private_key'] as String?,
        balance: json['balance'] as int?,
        cryptoCurrency: json['crypto_currency'] == null
            ? null
            : CryptoCurrency.fromJson(
                json['crypto_currency'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'address': address,
        'private_key': privateKey,
        'balance': balance,
        'crypto_currency': cryptoCurrency?.toJson(),
      };
}

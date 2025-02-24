import 'crypto_currency.dart';
import 'currency.dart';
import 'payment_method.dart';
import 'user.dart';

class Data {
  int? id;
  String? price;
  Currency? currency;
  String? amount;
  String? minLimit;
  String? maxLimit;
  String? type;
  String? description;
  String? status;
  String? createdAtFormat;
  User? user;
  CryptoCurrency? cryptoCurrency;
  List<PaymentMethod>? paymentMethod;

  Data({
    this.id,
    this.price,
    this.currency,
    this.amount,
    this.minLimit,
    this.maxLimit,
    this.type,
    this.description,
    this.status,
    this.createdAtFormat,
    this.user,
    this.cryptoCurrency,
    this.paymentMethod,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['id'] as int?,
        price: json['price'] as String?,
        currency: json['currency'] == null
            ? null
            : Currency.fromJson(json['currency'] as Map<String, dynamic>),
        amount: json['amount'] as String?,
        minLimit: json['min_limit'] as String?,
        maxLimit: json['max_limit'] as String?,
        type: json['type'] as String?,
        description: json['description'] as String?,
        status: json['status'] as String?,
        createdAtFormat: json['created_at_format'] as String?,
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
        cryptoCurrency: json['crypto_currency'] == null
            ? null
            : CryptoCurrency.fromJson(
                json['crypto_currency'] as Map<String, dynamic>),
        paymentMethod: (json['payment_method'] as List<dynamic>?)
            ?.map((e) => PaymentMethod.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'price': price,
        'currency': currency?.toJson(),
        'amount': amount,
        'min_limit': minLimit,
        'max_limit': maxLimit,
        'type': type,
        'description': description,
        'status': status,
        'created_at_format': createdAtFormat,
        'user': user?.toJson(),
        'crypto_currency': cryptoCurrency?.toJson(),
        'payment_method': paymentMethod?.map((e) => e.toJson()).toList(),
      };
}

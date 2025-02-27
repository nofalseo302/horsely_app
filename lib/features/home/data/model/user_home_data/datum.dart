import 'crypto_currency.dart';
import 'currency.dart';
import 'user.dart';

class P2pItem {
  int? id;
  String? price;
  Currency? currency;
  String? amount;
  String? avaliableAmount;
  String? minLimit;
  String? maxLimit;
  String? type;
  String? description;
  String? status;
  String? createdAtFormat;
  User? user;
  CryptoCurrency? cryptoCurrency;
  List<PaymentMethod>? paymentMethod;

  P2pItem({
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
    this.avaliableAmount,
    this.paymentMethod,
  });

  factory P2pItem.fromJson(Map<String, dynamic> json) => P2pItem(
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
        avaliableAmount: json['avaliable_amount'] as String?,
        createdAtFormat: json['created_at'] as String?,
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
        cryptoCurrency: json['crypto_currency'] == null
            ? null
            : CryptoCurrency.fromJson(
                json['crypto_currency'] as Map<String, dynamic>),
        paymentMethod: json['payment_method'] == null
            ? null
            : (json['payment_method'] as List<dynamic>)
                .map((e) => PaymentMethod.fromJson(e as Map<String, dynamic>))
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
        'avaliable_amount': avaliableAmount,
        'created_at_format': createdAtFormat,
        'user': user?.toJson(),
        'crypto_currency': cryptoCurrency?.toJson(),
        'payment_method': paymentMethod,
      };
}

class PaymentMethod {
  int? id;
  String? name;

  PaymentMethod({this.id, this.name});

  PaymentMethod.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

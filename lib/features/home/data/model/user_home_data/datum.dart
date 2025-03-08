import 'crypto_currency.dart';
import 'currency.dart';
import 'user.dart';

class P2pItem {
  int? id;
  double? price;
  Currency? currency;
  double? amount;
  double? avaliableAmount;
  double? minLimit;
  double? maxLimit;
  String? type;
  String? description;
  String? status;
  double? profit;
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
    this.profit,
    this.cryptoCurrency,
    this.avaliableAmount,
    this.paymentMethod,
  });

  factory P2pItem.fromJson(Map<String, dynamic> json) => P2pItem(
        id: json['id'] as int?,
        price: (double.tryParse(json['price']) ?? 0.0),
        currency: json['currency'] == null
            ? null
            : Currency.fromJson(json['currency'] as Map<String, dynamic>),
        amount: (double.tryParse(json['amount']) ?? 0.0),
        minLimit: json['min_limit'] == null
            ? null
            : (double.tryParse(json['min_limit']) ?? 0.0),
        maxLimit: json['max_limit'] == null
            ? null
            : (double.tryParse(json['max_limit']) ?? 0.0),
        type: json['type'] as String?,
        description: json['description'] as String?,
        status: json['status'] as String?,
        avaliableAmount: (double.tryParse(json['avaliable_amount']) ?? 0.0),
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
        profit: json['profit'] == null ? null : (json['profit'].toDouble()),
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

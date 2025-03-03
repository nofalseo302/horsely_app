import 'crypto_currency.dart';
import 'currency.dart';
import 'user.dart';

class OfferModel {
  int? id;
  User? user;
  String? amount;
  String? price;
  String? tax;
  String? messageCount;
  String? status;

  int? totalPrice;
  Currency? currency;
  CryptoCurrency? cryptoCurrency;
  String? paymentMethod;

  OfferModel({
    this.id,
    this.user,
    this.amount,
    this.price,
    this.tax,
    this.messageCount,
    this.totalPrice,
    this.currency,
    this.cryptoCurrency,
    this.paymentMethod,
    this.status
  });

  factory OfferModel.fromJson(Map<String, dynamic> json) => OfferModel(
        id: json['id'] as int?,
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
        amount: json['amount'] as String?,
        price: json['price'] as String?,
        tax: json['tax'] as String?,
        totalPrice: json['total_price'] as int?,
        currency: json['currency'] == null
            ? null
            : Currency.fromJson(json['currency'] as Map<String, dynamic>),
        messageCount: json['message_count'] == null
            ? null
            : (json['message_count'].toString()),
          status:json['status']as String?,
        cryptoCurrency: json['crypto_currency'] == null
            ? null
            : CryptoCurrency.fromJson(
                json['crypto_currency'] as Map<String, dynamic>),
        paymentMethod: json['payment_method'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user': user?.toJson(),
        'amount': amount,
        'price': price,
        'tax': tax,
        'total_price': totalPrice,
        'currency': currency?.toJson(),
        'crypto_currency': cryptoCurrency?.toJson(),
        'payment_method': paymentMethod,
      };
}

import 'package:horsely_app/core/services/network_service/endpoints.dart';

class HomeDataRequest {
  final String? search;
  OfferType offerType;
  final int? minPrice;
  final int? maxPrice;
  final int? minLimit;
  final int? maxLimit;
  final List<int>? coinType;
  final List<int>? currencyType;
  final List<int>? paymentMethods;

  HomeDataRequest({
    this.search,
    required this.offerType,
    this.minPrice,
    this.maxPrice,
    this.minLimit,
    this.maxLimit,
    this.coinType,
    this.currencyType,
    this.paymentMethods,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = {'type': EndPoints.buy, "key_words": search};
    data['type'] = offerType.name;
    if (minPrice != null) data['min_price'] = minPrice;
    if (maxPrice != null) data['max_price'] = maxPrice;
    if (minLimit != null) data['min_limit'] = minLimit;
    if (maxLimit != null) data['max_limit'] = maxLimit;
    if (coinType != null) data['coin_type[]'] = coinType;
    if (currencyType != null) data['currency_type[]'] = currencyType;
    if (paymentMethods != null) data['payment_meathods[]'] = paymentMethods;

    return data;
  }
}

enum OfferType {
  buy,
  sell,
}

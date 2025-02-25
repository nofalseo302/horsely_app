import 'package:horsely_app/core/services/network_service/api_service.dart';

class CurrencyRepo {
  static final CurrencyRepo _orderRepo = CurrencyRepo._internal();
  CurrencyRepo._internal();
  factory CurrencyRepo() {
    return _orderRepo;
  }
  final DioImpl _dioHelper = DioImpl();
}

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/models/errors/error_message_model.dart';
import 'package:horsely_app/core/services/network_service/api_service.dart';
import 'package:horsely_app/core/services/network_service/endpoints.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/features/wallet/data/model/crypto_currency_model/crypto_currency_model.dart';

class CurrencyRepo {
  static final CurrencyRepo _orderRepo = CurrencyRepo._internal();
  CurrencyRepo._internal();
  factory CurrencyRepo() {
    return _orderRepo;
  }
  final DioImpl _dioHelper = DioImpl();
}

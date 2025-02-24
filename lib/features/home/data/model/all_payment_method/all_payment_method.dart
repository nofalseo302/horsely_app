import 'package:horsely_app/features/account/features/transaction/data/model/creatp2p_model/payment_method.dart';

class AllPaymentMethod {
  bool? status;
  int? statusCode;
  List<PaymentMethod>? data;
  String? message;

  AllPaymentMethod({this.status, this.statusCode, this.data, this.message});

  factory AllPaymentMethod.fromJson(Map<String, dynamic> json) {
    return AllPaymentMethod(
      status: json['status'] as bool?,
      statusCode: json['status_code'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => PaymentMethod.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'status_code': statusCode,
        'data': data?.map((e) => e.toJson()).toList(),
        'message': message,
      };
}

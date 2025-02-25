import 'package:horsely_app/features/home/data/model/all_payment_method/datum.dart';

class AllPaymentMethod {
  bool? status;
  int? statusCode;
  List<DataPay>? data;
  String? message;

  AllPaymentMethod({this.status, this.statusCode, this.data, this.message});

  AllPaymentMethod.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['status_code'];
    if (json['data'] != null) {
      data = <DataPay>[];
      json['data'].forEach((v) {
        data!.add(DataPay.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['status_code'] = statusCode;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

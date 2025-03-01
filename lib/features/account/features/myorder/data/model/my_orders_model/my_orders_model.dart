import 'data.dart';

class MyOrdersModel {
  bool? status;
  int? statusCode;
  MyOrders? data;
  String? message;

  MyOrdersModel({this.status, this.statusCode, this.data, this.message});

  factory MyOrdersModel.fromJson(Map<String, dynamic> json) => MyOrdersModel(
        status: json['status'] as bool?,
        statusCode: json['status_code'] as int?,
        data: json['data'] == null
            ? null
            : MyOrders.fromJson(json['data'] as Map<String, dynamic>),
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'status_code': statusCode,
        'data': data?.toJson(),
        'message': message,
      };
}

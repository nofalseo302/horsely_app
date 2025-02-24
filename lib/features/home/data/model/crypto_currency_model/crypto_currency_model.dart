import 'datum.dart';

class CryptoCurrencyModel {
  bool? status;
  int? statusCode;
  List<Datum>? data;
  String? message;

  CryptoCurrencyModel({
    this.status,
    this.statusCode,
    this.data,
    this.message,
  });

  factory CryptoCurrencyModel.fromJson(Map<String, dynamic> json) {
    return CryptoCurrencyModel(
      status: json['status'] as bool?,
      statusCode: json['status_code'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
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

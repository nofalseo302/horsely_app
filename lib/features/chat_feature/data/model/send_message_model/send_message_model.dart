import 'data.dart';

class SendMessageModel {
  bool? status;
  int? statusCode;
  Data? data;
  String? message;

  SendMessageModel({this.status, this.statusCode, this.data, this.message});

  factory SendMessageModel.fromJson(Map<String, dynamic> json) {
    return SendMessageModel(
      status: json['status'] as bool?,
      statusCode: json['status_code'] as int?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'status_code': statusCode,
        'data': data?.toJson(),
        'message': message,
      };
}

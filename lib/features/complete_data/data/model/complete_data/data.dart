import 'attachment.dart';

class Data {
  int? id;
  int? userId;
  String? jobType;
  String? workAddress;
  String? companyName;
  String? taxNumber;
  String? documentStatus;
  List<Attachment>? attachments;

  Data({
    this.id,
    this.userId,
    this.jobType,
    this.workAddress,
    this.companyName,
    this.taxNumber,
    this.documentStatus,
    this.attachments,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['id'] as int?,
        userId: json['user_id'] as int?,
        jobType: json['job_type'] as String?,
        workAddress: json['work_address'] as String?,
        companyName: json['company_name'] as String?,
        taxNumber: json['tax_number'] as String?,
        documentStatus: json['document_status'] as String?,
        attachments: (json['attachments'] as List<dynamic>?)
            ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'job_type': jobType,
        'work_address': workAddress,
        'company_name': companyName,
        'tax_number': taxNumber,
        'document_status': documentStatus,
        'attachments': attachments?.map((e) => e.toJson()).toList(),
      };
}

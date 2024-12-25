class Data {
  int? id;
  String? type;
  String? name;
  String? email;
  String? mobileCountryCode;
  String? mobile;
  String? image;
  bool? isActiveAccount;
  bool? isComplete;
  String? completeDataStatus;
  String? token;

  Data({
    this.id,
    this.type,
    this.name,
    this.email,
    this.mobileCountryCode,
    this.mobile,
    this.image,
    this.isActiveAccount,
    this.isComplete,
    this.completeDataStatus,
    this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['id'] as int?,
        type: json['type'] as String?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        mobileCountryCode: json['mobile_country_code'] as String?,
        mobile: json['mobile'] as String?,
        image: json['image'] as String?,
        isActiveAccount: json['is_active_account'] as bool?,
        isComplete: json['is_complete'] as bool?,
        completeDataStatus: json['complete_data_status'] as dynamic,
        token: json['token'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'name': name,
        'email': email,
        'mobile_country_code': mobileCountryCode,
        'mobile': mobile,
        'image': image,
        'is_active_account': isActiveAccount,
        'is_complete': isComplete,
        'complete_data_status': completeDataStatus,
        'token': token,
      };
}

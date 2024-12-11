class UserModel {
  bool? status;
  int? statusCode;
  UserData? data;
  String? message;

  UserModel({this.status, this.statusCode, this.data, this.message});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['status_code'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['status_code'] = statusCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class UserData {
  int? id;
  String? type;
  String? name;
  String? email;
  String? dateOfBirth;
  int? countryId;
  String? mobileCountryCode;
  String? mobile;
  String? image;
  bool? isPlanSubscribe;
  bool? emailVerifiedAt;
  String? token;

  UserData(
      {this.id,
      this.type,
      this.name,
      this.email,
      this.countryId,
      this.mobileCountryCode,
      this.mobile,
      this.dateOfBirth,
      this.image,
      this.isPlanSubscribe,
      this.emailVerifiedAt,
      this.token});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    name = json['name'];
    email = json['email'];
    countryId = json['country_id'];
    mobileCountryCode = json['mobile_country_code'];
    mobile = json['mobile'];
    image = json['image'];
    isPlanSubscribe = json['is_plan_subscribe'];
    emailVerifiedAt = json['is_active_account'];
    token = json['token'];
    dateOfBirth = json['date_of_birth'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['name'] = name;
    data['email'] = email;
    data['country_id'] = countryId;
    data['mobile_country_code'] = mobileCountryCode;
    data['mobile'] = mobile;
    data['image'] = image;
    data['is_plan_subscribe'] = isPlanSubscribe;
    data['is_active_account'] = emailVerifiedAt;
    data['token'] = token;
    data['date_of_birth'] = dateOfBirth ?? '';
    return data;
  }
}

class GoogleResponseModel {
  bool? status;
  int? statusCode;
  Data? data;
  String? message;

  GoogleResponseModel({this.status, this.statusCode, this.data, this.message});

  GoogleResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['status_code'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
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

class Data {
  bool? isComplete;
  String? name;
  User? user;

  Data({this.isComplete, this.name, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    isComplete = json['is_complete'];
    name = json['name'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['is_complete'] = isComplete;
    data['name'] = name;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? mobileCountryCode;
  String? mobile;
  String? image;
  String? dateOfBirth;
  bool? isActiveAccount;
  String? token;

  User(
      {this.id,
      this.name,
      this.email,
      this.mobileCountryCode,
      this.mobile,
      this.image,
      this.dateOfBirth,
      this.isActiveAccount,
      this.token});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobileCountryCode = json['mobile_country_code'];
    mobile = json['mobile'];
    image = json['image'];
    dateOfBirth = json['date_of_birth'];
    isActiveAccount = json['is_active_account'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['mobile_country_code'] = mobileCountryCode;
    data['mobile'] = mobile;
    data['image'] = image;
    data['date_of_birth'] = dateOfBirth;
    data['is_active_account'] = isActiveAccount;
    data['token'] = token;
    return data;
  }
}

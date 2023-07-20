class LoginApiResponse {
  LoginApiResponse({
    required this.status,
    required this.message,
    required this.data,
    required this.referData,
  });
  late final int status;
  late final String message;
  late final UserData data;
  late final ReferData referData;
  
  LoginApiResponse.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = UserData.fromJson(json['data']);
    referData = ReferData.fromJson(json['refer_data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data.toJson();
    _data['refer_data'] = referData.toJson();
    return _data;
  }
}

class UserData {
  UserData({
    required this.userid,
    required this.userToken,
    required this.name,
    required this.profile,
    required this.phone,
    required this.email,
    required this.facebook,
    required this.method,
    required this.isVerified,
    required this.accountStatus,
    required this.deviceModel,
  });
  late final String userid;
  late final String userToken;
  late final String name;
  late final String profile;
  late final String phone;
  late final String email;
  late final String facebook;
  late final String method;
  late final String isVerified;
  late final String accountStatus;
  late final String deviceModel;
  
  UserData.fromJson(Map<String, dynamic> json){
    userid = json['userid'];
    userToken = json['user_token'];
    name = json['name'];
    profile = json['profile'];
    phone = json['phone'];
    email = json['email'];
    facebook = json['facebook'];
    method = json['method'];
    isVerified = json['is_verified'];
    accountStatus = json['account_status'];
    deviceModel = json['device_model'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['userid'] = userid;
    _data['user_token'] = userToken;
    _data['name'] = name;
    _data['profile'] = profile;
    _data['phone'] = phone;
    _data['email'] = email;
    _data['facebook'] = facebook;
    _data['method'] = method;
    _data['is_verified'] = isVerified;
    _data['account_status'] = accountStatus;
    _data['device_model'] = deviceModel;
    return _data;
  }
}

class ReferData {
  ReferData({
    required this.id,
    required this.userToken,
    required this.refercode,
    required this.referBy,
    required this.isActive,
    required this.isPaid,
  });
  late final String id;
  late final String userToken;
  late final String refercode;
  late final String referBy;
  late final String isActive;
  late final String isPaid;
  
  ReferData.fromJson(Map<String, dynamic> json){
    id = json['id'];
    userToken = json['user_token'];
    refercode = json['refercode'];
    referBy = json['refer_by'];
    isActive = json['is_active'];
    isPaid = json['is_paid'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user_token'] = userToken;
    _data['refercode'] = refercode;
    _data['refer_by'] = referBy;
    _data['is_active'] = isActive;
    _data['is_paid'] = isPaid;
    return _data;
  }
}
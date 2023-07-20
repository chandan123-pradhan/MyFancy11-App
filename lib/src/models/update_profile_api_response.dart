class UpdateProfileApiReponse {
  UpdateProfileApiReponse({
    required this.status,
    required this.message,
    required this.updatedData,
  });
  late final int status;
  late final String message;
  late final UpdatedData updatedData;
  
  UpdateProfileApiReponse.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    updatedData = UpdatedData.fromJson(json['updated_data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['updated_data'] = updatedData.toJson();
    return _data;
  }
}

class UpdatedData {
  UpdatedData({
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
  
  UpdatedData.fromJson(Map<String, dynamic> json){
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
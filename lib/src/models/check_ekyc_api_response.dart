class CheckEkyApiResponse {
  CheckEkyApiResponse({
    required this.status,
    required this.message,
    required this.data,
  });
  late final int status;
  late final String message;
  late final EKycData data;
  
  CheckEkyApiResponse.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = EKycData.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data.toJson();
    return _data;
  }
}

class EKycData {
  EKycData({
    required this.id,
    required this.userToken,
    required this.img,
    required this.isDefault,
    required this.bankName,
    required this.ifscCode,
    required this.accountNumber,
    required this.bankHolder,
    required this.upi,
    required this.status,
    required this.createdAt,
  });
  late final String id;
  late final String userToken;
  late final String img;
  late final String isDefault;
  late final String bankName;
  late final String ifscCode;
  late final String accountNumber;
  late final String bankHolder;
  late final String upi;
  late final String status;
  late final String createdAt;
  
  EKycData.fromJson(Map<String, dynamic> json){
    id = json['id'];
    userToken = json['user_token'];
    img = json['img'];
    isDefault = json['is_default'];
    bankName = json['bank_name'];
    ifscCode = json['ifsc_code'];
    accountNumber = json['account_number'];
    bankHolder = json['bank_holder'];
    upi = json['upi'];
    status = json['status'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user_token'] = userToken;
    _data['img'] = img;
    _data['is_default'] = isDefault;
    _data['bank_name'] = bankName;
    _data['ifsc_code'] = ifscCode;
    _data['account_number'] = accountNumber;
    _data['bank_holder'] = bankHolder;
    _data['upi'] = upi;
    _data['status'] = status;
    _data['created_at'] = createdAt;
    return _data;
  }
}
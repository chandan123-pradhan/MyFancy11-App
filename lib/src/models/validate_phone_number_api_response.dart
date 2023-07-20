class ValidatePhoneNumberApiResponse {
  ValidatePhoneNumberApiResponse({
    required this.status,
    required this.message,
    required this.otp,
  });
  late final int status;
  late final String message;
  late final int otp;
  
  ValidatePhoneNumberApiResponse.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['otp'] = otp;
    return _data;
  }
}
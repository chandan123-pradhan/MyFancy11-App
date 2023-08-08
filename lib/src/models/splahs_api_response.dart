class SplashDataApiResponse {
  SplashDataApiResponse({
    required this.status,
    required this.message,
    required this.data,
    required this.loginBanner,
    required this.islogin,
  });
  late final int status;
  late final String message;
  late final Data data;
  late final List<LoginBanner> loginBanner;
  late final List<LoginBanner>homeBanner;
  late final bool islogin;
  
  SplashDataApiResponse.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = Data.fromJson(json['data']);
    loginBanner = List.from(json['login_banner']).map((e)=>LoginBanner.fromJson(e)).toList();
    homeBanner=List.from(json['home_banner']).map((e)=>LoginBanner.fromJson(e)).toList();
    islogin = json['islogin'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data.toJson();
    _data['login_banner'] = loginBanner.map((e)=>e.toJson()).toList();
    _data['home_banner']=homeBanner.map((e)=>e.toJson()).toList();
    _data['islogin'] = islogin;
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.appToken,
    required this.appLive,
    required this.packageName,
    required this.referBonus,
    required this.appVersion,
    required this.referMsg,
    required this.updateMsgHtml,
    required this.downloadUrl,
    required this.privacyUrl,
    required this.termUrl,
    required this.userAggreementUrl,
    required this.liveScore,
  });
  late final String id;
  late final String appToken;
  late final String appLive;
  late final String packageName;
  late final String referBonus;
  late final String appVersion;
  late final String referMsg;
  late final String updateMsgHtml;
  late final String downloadUrl;
  late final String privacyUrl;
  late final String termUrl;
  late final String userAggreementUrl;
  late final String liveScore;
  
  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    appToken = json['app_token'];
    appLive = json['app_live'];
    packageName = json['package_name'];
    referBonus = json['refer_bonus'];
    appVersion = json['app_version'];
    referMsg = json['refer_msg'];
    updateMsgHtml = json['update_msg_html'];
    downloadUrl = json['download_url'];
    privacyUrl = json['privacy_url'];
    termUrl = json['term_url'];
    userAggreementUrl = json['user_aggreement_url'];
    liveScore = json['live_score'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['app_token'] = appToken;
    _data['app_live'] = appLive;
    _data['package_name'] = packageName;
    _data['refer_bonus'] = referBonus;
    _data['app_version'] = appVersion;
    _data['refer_msg'] = referMsg;
    _data['update_msg_html'] = updateMsgHtml;
    _data['download_url'] = downloadUrl;
    _data['privacy_url'] = privacyUrl;
    _data['term_url'] = termUrl;
    _data['user_aggreement_url'] = userAggreementUrl;
    _data['live_score'] = liveScore;
    return _data;
  }
}

class LoginBanner {
  LoginBanner({
    required this.id,
    required this.title,
    required this.description,
    required this.img,
    required this.status,
  });
  late final String id;
  late final String title;
  late final String description;
  late final String img;
  late final String status;
  
  LoginBanner.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    description = json['description'];
    img = json['img'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['description'] = description;
    _data['img'] = img;
    _data['status'] = status;
    return _data;
  }
}
// class SplashDataApiResponse {
//   SplashDataApiResponse({
//     required this.status,
//     required this.message,
//     required this.data,
//     required this.loginBanner,
//     required this.islogin,
//   });
//   late final int status;
//   late final String message;
//   late final Data data;
//   late final List<LoginBanner> loginBanner;
//   late final List<LoginBanner>homeBanner;
//   late final bool islogin;
  
//   SplashDataApiResponse.fromJson(Map<String, dynamic> json){
//     status = json['status'];
//     message = json['message'];
//     data = Data.fromJson(json['data']);
//     loginBanner = List.from(json['login_banner']).map((e)=>LoginBanner.fromJson(e)).toList();
//     homeBanner=List.from(json['home_banner']).map((e)=>LoginBanner.fromJson(e)).toList();
//     islogin = json['islogin'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['status'] = status;
//     _data['message'] = message;
//     _data['data'] = data.toJson();
//     _data['login_banner'] = loginBanner.map((e)=>e.toJson()).toList();
//     _data['home_banner']=homeBanner.map((e)=>e.toJson()).toList();
//     _data['islogin'] = islogin;
//     return _data;
//   }
// }

// class Data {
//   Data({
//     required this.id,
//     required this.appToken,
//     required this.appLive,
//     required this.packageName,
//     required this.referBonus,
//     required this.appVersion,
//     required this.referMsg,
//     required this.updateMsgHtml,
//     required this.downloadUrl,
//     required this.privacyUrl,
//     required this.termUrl,
//     required this.userAggreementUrl,
//     required this.liveScore,
//   });
//   late final String id;
//   late final String appToken;
//   late final String appLive;
//   late final String packageName;
//   late final String referBonus;
//   late final String appVersion;
//   late final String referMsg;
//   late final String updateMsgHtml;
//   late final String downloadUrl;
//   late final String privacyUrl;
//   late final String termUrl;
//   late final String userAggreementUrl;
//   late final String liveScore;
  
//   Data.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     appToken = json['app_token'];
//     appLive = json['app_live'];
//     packageName = json['package_name'];
//     referBonus = json['refer_bonus'];
//     appVersion = json['app_version'];
//     referMsg = json['refer_msg'];
//     updateMsgHtml = json['update_msg_html'];
//     downloadUrl = json['download_url'];
//     privacyUrl = json['privacy_url'];
//     termUrl = json['term_url'];
//     userAggreementUrl = json['user_aggreement_url'];
//     liveScore = json['live_score'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['app_token'] = appToken;
//     _data['app_live'] = appLive;
//     _data['package_name'] = packageName;
//     _data['refer_bonus'] = referBonus;
//     _data['app_version'] = appVersion;
//     _data['refer_msg'] = referMsg;
//     _data['update_msg_html'] = updateMsgHtml;
//     _data['download_url'] = downloadUrl;
//     _data['privacy_url'] = privacyUrl;
//     _data['term_url'] = termUrl;
//     _data['user_aggreement_url'] = userAggreementUrl;
//     _data['live_score'] = liveScore;
//     return _data;
//   }
// }

// class LoginBanner {
//   LoginBanner({
//     required this.id,
//     required this.title,
//     required this.description,
//     required this.img,
//     required this.status,
//   });
//   late final String id;
//   late final String title;
//   late final String description;
//   late final String img;
//   late final String status;
//   late final String type;
//   late final String matchId;
//   late final String action;
  
//   LoginBanner.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     title = json['title'];
//     description = json['description'];
//     img = json['img'];
//     status = json['status'];
//     type=json['type'];
//     matchId=json['match_id'].toString();
//     action=json['action'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['title'] = title;
//     _data['description'] = description;
//     _data['img'] = img;
//     _data['status'] = status;
//     _data['type']=type;
//     _data['match_id']=matchId;
//     _data['action']=action;
//     return _data;
//   }
// }

class SplashDataApiResponse {
  SplashDataApiResponse({
    required this.status,
    required this.message,
    required this.data,
    required this.loginBanner,
    required this.homeBanner,
    required this.islogin,
  });
  late final int status;
  late final String message;
  late final Data data;
  late final List<LoginBanner> loginBanner;
  late final List<HomeBanner> homeBanner;
  late final bool islogin;
  
  SplashDataApiResponse.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = Data.fromJson(json['data']);
    loginBanner = List.from(json['login_banner']).map((e)=>LoginBanner.fromJson(e)).toList();
    homeBanner = List.from(json['home_banner']).map((e)=>HomeBanner.fromJson(e)).toList();
    islogin = json['islogin'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data.toJson();
    _data['login_banner'] = loginBanner.map((e)=>e.toJson()).toList();
    _data['home_banner'] = homeBanner.map((e)=>e.toJson()).toList();
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
    required this.androidVersion,
    required this.referMsg,
    required this.updateMsgHtml,
    required this.androidApkUrl,
    required this.privacyUrl,
    required this.termUrl,
    required this.userAggreementUrl,
    required this.liveScore,
    required this.referPercent,
    required this.promotionPercent,
    required this.logo,
    required this.favicon,
    required this.upi,
    required this.iosVersion,
    required this.iosApkUrl
  });
  late final String id;
  late final String appToken;
  late final String appLive;
  late final String packageName;
  late final String referBonus;
  late final String androidVersion;
  late final String referMsg;
  late final String updateMsgHtml;
  late final String androidApkUrl;
  late final String privacyUrl;
  late final String termUrl;
  late final String userAggreementUrl;
  late final String liveScore;
  late final String referPercent;
  late final String promotionPercent;
  late final String logo;
  late final String favicon;
  late final String upi;
  late final String iosVersion;
  late final String iosApkUrl;
  
  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    appToken = json['app_token'];
    appLive = json['app_live'];
    packageName = json['package_name'];
    referBonus = json['refer_bonus'];
    androidVersion = json['app_version'];
    referMsg = json['refer_msg'];
    updateMsgHtml = json['update_msg_html'];
    androidApkUrl = json['download_url'];
    privacyUrl = json['privacy_url'];
    termUrl = json['term_url'];
    userAggreementUrl = json['user_aggreement_url'];
    liveScore = json['live_score'];
    referPercent = json['refer_percent'];
    promotionPercent = json['promotion_percent'];
    logo = json['logo'];
    favicon = json['favicon'];
    upi = json['upi'];
    iosVersion=json['ios_version'];
    iosApkUrl=json['ios_url'];

  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['app_token'] = appToken;
    _data['app_live'] = appLive;
    _data['package_name'] = packageName;
    _data['refer_bonus'] = referBonus;
    _data['app_version'] = androidVersion;
    _data['refer_msg'] = referMsg;
    _data['update_msg_html'] = updateMsgHtml;
    _data['download_url'] = androidApkUrl;
    _data['privacy_url'] = privacyUrl;
    _data['term_url'] = termUrl;
    _data['user_aggreement_url'] = userAggreementUrl;
    _data['live_score'] = liveScore;
    _data['refer_percent'] = referPercent;
    _data['promotion_percent'] = promotionPercent;
    _data['logo'] = logo;
    _data['favicon'] = favicon;
    _data['upi'] = upi;
    _data['ios_version']=iosVersion;
    _data['ios_url']=iosApkUrl;
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
    required this.type,
    required this.matchId,
    required this.action,
  });
  late final String id;
  late final String title;
  late final String description;
  late final String img;
  late final String status;
  late final String type;
  late final String matchId;
  late final String action;
  
  LoginBanner.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    description = json['description'];
    img = json['img'];
    status = json['status'];
    type = json['type'];
    matchId = json['match_id'];
    action = json['action'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['description'] = description;
    _data['img'] = img;
    _data['status'] = status;
    _data['type'] = type;
    _data['match_id'] = matchId;
    _data['action'] = action;
    return _data;
  }
}

class HomeBanner {
  HomeBanner({
    required this.id,
    required this.title,
    required this.description,
    required this.img,
    required this.status,
    required this.type,
    required this.matchId,
    required this.action,
  });
  late final String id;
  late final String title;
  late final String description;
  late final String img;
  late final String status;
  late final String type;
  late final String matchId;
  late final String action;
  
  HomeBanner.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    description = json['description'];
    img = json['img'];
    status = json['status'];
    type = json['type'];
    matchId = json['match_id'];
    action = json['action'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['description'] = description;
    _data['img'] = img;
    _data['status'] = status;
    _data['type'] = type;
    _data['match_id'] = matchId;
    _data['action'] = action;
    return _data;
  }
}
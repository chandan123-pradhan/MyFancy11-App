class MyRefferalApiResponse {
  MyRefferalApiResponse({
    required this.status,
    required this.message,
    required this.image,
    required this.setting,
    required this.refer,
    required this.data,
  });
  late final int status;
  late final String message;
  late final String image;
  late final String referBonusAmount;
  late final Setting setting;
  late final Refer refer;
  late final List<RefferUserData> data;

  MyRefferalApiResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    image = json['image'];
    referBonusAmount = json['refer_bonus'];
    setting = Setting.fromJson(json['setting']);
    refer = Refer.fromJson(json['refer']);
    data =
        List.from(json['data']).map((e) => RefferUserData.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['image'] = image;
    _data['refer_bonus'] = referBonusAmount;
    _data['setting'] = setting.toJson();
    _data['refer'] = refer.toJson();
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Setting {
  Setting({
    required this.referPercent,
    required this.promotionPercent,
    required this.upgradeRequest,
  });
  late final String referPercent;
  late final String promotionPercent;
  late final int upgradeRequest;

  Setting.fromJson(Map<String, dynamic> json) {
    referPercent = json['refer_percent'];
    promotionPercent = json['promotion_percent'];
    upgradeRequest = json['upgrade_request'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['refer_percent'] = referPercent;
    _data['promotion_percent'] = promotionPercent;
    _data['upgrade_request'] = upgradeRequest;
    return _data;
  }
}

class Refer {
  Refer({
    required this.id,
    required this.userToken,
    required this.refercode,
    required this.referBy,
    required this.isActive,
    required this.paidAmount,
    required this.accountType,
  });
  late final String id;
  late final String userToken;
  late final String refercode;
  late final String referBy;
  late final String isActive;
  late final String paidAmount;
  late final String accountType;

  Refer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userToken = json['user_token'];
    refercode = json['refercode'];
    referBy = json['refer_by'];
    isActive = json['is_active'];
    paidAmount = json['paid_amount'];
    accountType = json['account_type'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user_token'] = userToken;
    _data['refercode'] = refercode;
    _data['refer_by'] = referBy;
    _data['is_active'] = isActive;
    _data['paid_amount'] = paidAmount;
    _data['account_type'] = accountType;
    return _data;
  }
}

class RefferUserData {
  RefferUserData({
    required this.name,
    required this.profile,
    required this.userToken,
    required this.amount,
  });
  late final String name;
  late final String profile;
  late final String userToken;
  late final String amount;

  RefferUserData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    profile = json['profile'];
    userToken = json['user_token'];
    amount = json['amount'].toString();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['profile'] = profile;
    _data['user_token'] = userToken;
    _data['amount'] = amount;
    return _data;
  }
}

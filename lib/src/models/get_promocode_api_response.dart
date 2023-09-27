class GetPromoCode {
  GetPromoCode({
    required this.status,
    required this.message,
    required this.data,
  });
  late final int status;
  late final String message;
  late final List<PromoCodeData> data;
  
  GetPromoCode.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = List.from(json['data']).map((e)=>PromoCodeData.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class PromoCodeData {
  PromoCodeData({
    required this.promoId,
    required this.name,
    required this.code,
    required this.percent,
    required this.status,
    required this.amount,
    required this.promoLimit,
  });
  late final String promoId;
  late final String name;
  late final String code;
  late final String percent;
  late final String status;
  late final String amount;
  late final String promoLimit;
  
  PromoCodeData.fromJson(Map<String, dynamic> json){
    promoId = json['promo_id'];
    name = json['name'];
    code = json['code'];
    percent = json['percent'];
    status = json['status'];
    amount = json['amount'];
    promoLimit = json['promo_limit'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['promo_id'] = promoId;
    _data['name'] = name;
    _data['code'] = code;
    _data['percent'] = percent;
    _data['status'] = status;
    _data['amount'] = amount;
    _data['promo_limit'] = promoLimit;
    return _data;
  }
}
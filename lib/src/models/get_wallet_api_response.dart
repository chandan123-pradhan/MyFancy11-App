class GetWalletApiResponse {
  GetWalletApiResponse({
    required this.status,
    required this.message,
    required this.data,
  });
  late final int status;
  late final String message;
  late final WalletData data;
  
  GetWalletApiResponse.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = WalletData.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data.toJson();
    return _data;
  }
}

class WalletData {
  WalletData({
    required this.bonusWallet,
    required this.depositWallet,
    required this.winningWallet,
  });
  late final int bonusWallet;
  late final String depositWallet;
  late final int winningWallet;
  
  WalletData.fromJson(Map<String, dynamic> json){
    bonusWallet = json['bonus_wallet'];
    depositWallet = json['deposit_wallet'].toString();
    winningWallet = json['winning_wallet'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['bonus_wallet'] = bonusWallet;
    _data['deposit_wallet'] = depositWallet;
    _data['winning_wallet'] = winningWallet;
    return _data;
  }
}
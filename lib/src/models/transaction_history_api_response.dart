class GetTransactionHistoryApiResponse {
  GetTransactionHistoryApiResponse({
    required this.status,
    required this.message,
    required this.data,
  });
  late final int status;
  late final String message;
  late final List<TransactionHistory> data;
  
  GetTransactionHistoryApiResponse.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = List.from(json['data']).map((e)=>TransactionHistory.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class TransactionHistory {
  TransactionHistory({
    required this.date,
    required this.transactionData,
  });
  late final String date;
  late final List<TransactionData> transactionData;
  
  TransactionHistory.fromJson(Map<String, dynamic> json){
    date = json['date'];
    transactionData = List.from(json['data']).map((e)=>TransactionData.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['date'] = date;
    _data['data'] = transactionData.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class TransactionData {
  TransactionData({
    required this.id,
    required this.userId,
    required this.referralUseid,
    required this.amount,
    required this.type,
    required this.transectionDetail,
    required this.transactionStatus,
    required this.transectionMode,
    required this.contestId,
    required this.withdrowRequest,
    required this.transectionVia,
    required this.createdDate,
    required this.modifiedDate,
  });
  late final String id;
  late final String userId;
  late final String referralUseid;
  late final String amount;
  late final String type;
  late final String transectionDetail;
  late final String transactionStatus;
  late final String transectionMode;
  late final String contestId;
  late final String withdrowRequest;
  late final String transectionVia;
  late final String createdDate;
  late final String modifiedDate;
  
  TransactionData.fromJson(Map<String, dynamic> json){
    id = json['id'];
    userId = json['user_id'];
    referralUseid = json['referralUseid'].toString();
    amount = json['amount'];
    type = json['type'];
    transectionDetail = json['transectionDetail'].toString();
    transactionStatus = json['transaction_status'];
    transectionMode = json['transection_mode'];
    contestId = json['contestId'].toString();
    withdrowRequest = json['withdrowRequest'].toString();
    transectionVia = json['transectionVia'].toString();
    createdDate = json['created_date'];
    modifiedDate = json['modified_date'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user_id'] = userId;
    _data['referral_useid'] = referralUseid;
    _data['amount'] = amount;
    _data['type'] = type;
    _data['transection_detail'] = transectionDetail;
    _data['transaction_status'] = transactionStatus;
    _data['transection_mode'] = transectionMode;
    _data['contest_id'] = contestId;
    _data['withdrow_request'] = withdrowRequest;
    _data['transection_via'] = transectionVia;
    _data['created_date'] = createdDate;
    _data['modified_date'] = modifiedDate;
    return _data;
  }
}
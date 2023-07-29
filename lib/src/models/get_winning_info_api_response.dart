class GetWinningInfoApiResponse {
  GetWinningInfoApiResponse({
    required this.status,
    required this.message,
    required this.data,
  });
  late final int status;
  late final String message;
  late final List<Data> data;
  
  GetWinningInfoApiResponse.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.winningInfoId,
    required this.contestId,
    required this.rank,
    required this.fromRank,
    required this.toRank,
    required this.price,
  });
  late final String winningInfoId;
  late final String contestId;
  late final String rank;
  late final String fromRank;
  late final String toRank;
  late final String price;
  
  Data.fromJson(Map<String, dynamic> json){
    winningInfoId = json['winning_info_id'];
    contestId = json['contest_id'];
    rank = json['rank'];
    fromRank = json['from_rank'];
    toRank = json['to_rank'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['winning_info_id'] = winningInfoId;
    _data['contest_id'] = contestId;
    _data['rank'] = rank;
    _data['from_rank'] = fromRank;
    _data['to_rank'] = toRank;
    _data['price'] = price;
    return _data;
  }
}
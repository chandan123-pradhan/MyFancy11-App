class GetLeaderboardApiResponse {
  GetLeaderboardApiResponse({
    required this.status,
    required this.message,
    required this.data,
  });
  late final int status;
  late final String message;
  late final List<LeaderboardData> data;
  
  GetLeaderboardApiResponse.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = List.from(json['data']).map((e)=>LeaderboardData.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class LeaderboardData {
  LeaderboardData({
    required this.id,
    required this.profile,
    required this.teamid,
    required this.rank,
    required this.name,
    required this.userId,
    required this.winAmount,
    required this.points,
    required this.TeamName,
  });
  late final String id;
  late final String profile;
  late final String teamid;
  late final String rank;
  late final String name;
  late final String userId;
  late final String winAmount;
  late final String points;
  late final String TeamName;
  
  LeaderboardData.fromJson(Map<String, dynamic> json){
    id = json['id'];
    profile = json['profile'];
    teamid = json['teamid'];
    rank = json['rank'];
    name = json['name'];
    userId = json['user_id'];
winAmount=json['win_amount'].toString();
    points = json['points'];
    TeamName = json['TeamName'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['profile'] = profile;
    _data['teamid'] = teamid;
    _data['rank'] = rank;
    _data['name'] = name;
    _data['user_id'] = userId;
    _data['win_amount']=winAmount;
    _data['points'] = points;
    _data['TeamName'] = TeamName;
    return _data;
  }
}
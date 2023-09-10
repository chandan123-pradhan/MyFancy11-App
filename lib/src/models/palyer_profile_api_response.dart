class PlayerProfileApiResponse {
  PlayerProfileApiResponse({
    required this.status,
    required this.message,
    required this.playerinfo,
    required this.state,
  });
  late final int status;
  late final String message;
  late final Playerinfo playerinfo;
  late final State state;
  
  PlayerProfileApiResponse.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    playerinfo = Playerinfo.fromJson(json['playerinfo']);
    state = State.fromJson(json['state']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['playerinfo'] = playerinfo.toJson();
    _data['state'] = state.toJson();
    return _data;
  }
}

class Playerinfo {
  Playerinfo({
    required this.name,
    required this.designationid,
    required this.creditPoints,
    required this.image,
    required this.dob,
    required this.bowls,
    required this.bats,
  });
  late final String name;
  late final String designationid;
  late final String creditPoints;
  late final String image;
  late final String dob;
  late final String bowls;
  late final String bats;
  
  Playerinfo.fromJson(Map<String, dynamic> json){
    name = json['name'];
    designationid = json['designationid'];
    creditPoints = json['credit_points'];
    image = json['image'];
    dob = json['dob'];
    bowls = json['bowls'].toString();
    bats = json['bats'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['designationid'] = designationid;
    _data['credit_points'] = creditPoints;
    _data['image'] = image;
    _data['dob'] = dob;
    _data['bowls'] = bowls;
    _data['bats'] = bats;
    return _data;
  }
}

class State {
  State({
    required this.id,
    required this.matchid,
    required this.teamid,
    required this.playerid,
    required this.playingStatus,
    required this.isSelect,
    required this.points,
    required this.selectionPercent,
    required this.totalPoints,
    required this.bollingPoints,
    required this.fieldingPoints,
    required this.playingScore,
    required this.secondInningsBatting,
    required this.secondInningsBolling,
    required this.secondInningsFielding,
    required this.designationid,
    required this.createdDate,
    required this.modifiedDate,
    required this.lastMatchPlayed,
  });
  late final String id;
  late final String matchid;
  late final String teamid;
  late final String playerid;
  late final String playingStatus;
  late final String isSelect;
  late final String points;
  late final String selectionPercent;
  late final String totalPoints;
  late final String bollingPoints;
  late final String fieldingPoints;
  late final String playingScore;
  late final String secondInningsBatting;
  late final String secondInningsBolling;
  late final String secondInningsFielding;
  late final String designationid;
  late final String createdDate;
  late final String modifiedDate;
  late final String lastMatchPlayed;
  
  State.fromJson(Map<String, dynamic> json){
    id = json['id'];
    matchid = json['matchid'];
    teamid = json['teamid'];
    playerid = json['playerid'];
    playingStatus = json['playing_status'];
    isSelect = json['is_select'];
    points = json['points'];
    selectionPercent = json['selection_percent'];
    totalPoints = json['total_points'];
    bollingPoints = json['bolling_points'];
    fieldingPoints = json['fielding_points'];
    playingScore = json['playing_score'];
    secondInningsBatting = json['second_innings_batting'];
    secondInningsBolling = json['second_innings_bolling'];
    secondInningsFielding = json['second_innings_fielding'];
    designationid = json['designationid'];
    createdDate = json['created_date'];
    modifiedDate = json['modified_date'];
    lastMatchPlayed = json['last_match_played'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['matchid'] = matchid;
    _data['teamid'] = teamid;
    _data['playerid'] = playerid;
    _data['playing_status'] = playingStatus;
    _data['is_select'] = isSelect;
    _data['points'] = points;
    _data['selection_percent'] = selectionPercent;
    _data['total_points'] = totalPoints;
    _data['bolling_points'] = bollingPoints;
    _data['fielding_points'] = fieldingPoints;
    _data['playing_score'] = playingScore;
    _data['second_innings_batting'] = secondInningsBatting;
    _data['second_innings_bolling'] = secondInningsBolling;
    _data['second_innings_fielding'] = secondInningsFielding;
    _data['designationid'] = designationid;
    _data['created_date'] = createdDate;
    _data['modified_date'] = modifiedDate;
    _data['last_match_played'] = lastMatchPlayed;
    return _data;
  }
}
class GetMyPlayerApiResponse {
  GetMyPlayerApiResponse({
    required this.status,
    required this.message,
    required this.data,
  });
  late final int status;
  late final String message;
  late final List<MyPlayerData> data;
  
  GetMyPlayerApiResponse.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = List.from(json['data']).map((e)=>MyPlayerData.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class MyPlayerData {
  MyPlayerData({
    required this.playerId,
    required this.designationid,
    required this.isCaptain,
    required this.isVicecaptain,
    required this.totalPoints,
    required this.playingStatus,
    required this.name,
    required this.image,
    required this.teamid,
    required this.team,
  });
  late final String playerId;
  late final String designationid;
  late final String isCaptain;
  late final String isVicecaptain;
  late final String totalPoints;
  late final String playingStatus;
  late final String name;
  late final String image;
  late final String teamid;
  late final Team team;
  
  MyPlayerData.fromJson(Map<String, dynamic> json){
    playerId = json['player_id'];
    designationid = json['designationid'];
    isCaptain = json['is_captain'];
    isVicecaptain = json['is_vicecaptain'];
    totalPoints = json['total_points'];
    playingStatus = json['playing_status'];
    name = json['name'];
    image = json['image'];
    teamid = json['teamid'];
    team = Team.fromJson(json['team']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['player_id'] = playerId;
    _data['designationid'] = designationid;
    _data['is_captain'] = isCaptain;
    _data['is_vicecaptain'] = isVicecaptain;
    _data['total_points'] = totalPoints;
    _data['playing_status'] = playingStatus;
    _data['name'] = name;
    _data['image'] = image;
    _data['teamid'] = teamid;
    _data['team'] = team.toJson();
    return _data;
  }
}

class Team {
  Team({
    required this.teamId,
    required this.uniqueId,
    required this.teamName,
    required this.teamShortName,
    required this.teamImage,
    required this.modifiedDate,
  });
  late final String teamId;
  late final String uniqueId;
  late final String teamName;
  late final String teamShortName;
  late final String teamImage;
  late final String modifiedDate;
  
  Team.fromJson(Map<String, dynamic> json){
    teamId = json['team_id'];
    uniqueId = json['unique_id'];
    teamName = json['team_name'];
    teamShortName = json['team_short_name'];
    teamImage = json['team_image'];
    modifiedDate = json['modified_date'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['team_id'] = teamId;
    _data['unique_id'] = uniqueId;
    _data['team_name'] = teamName;
    _data['team_short_name'] = teamShortName;
    _data['team_image'] = teamImage;
    _data['modified_date'] = modifiedDate;
    return _data;
  }
}
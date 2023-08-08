class GetSquadApiResponse {
  GetSquadApiResponse({
    required this.status,
    required this.message,
    required this.data,
  });
  late final int status;
  late final String message;
  late final List<SquadPlayer> data;
  
  GetSquadApiResponse.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = List.from(json['data']).map((e)=>SquadPlayer.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class SquadPlayer {
  SquadPlayer({
    required this.lastMachPlayed,
    required this.id,
    required this.playerPoints,
    required this.selectionPercent,
    required this.matchid,
    required this.teamid,
    required this.playerid,
    required this.isSelect,
    required this.teamName,
    required this.teamImage,
    required this.teamShortName,
    required this.creditPoints,
    required this.name,
    required this.image,
    required this.title,
    required this.shortTerm,
    required this.designationid,
    required this.playingStatus,
    required this.teamNumber,
    required this.playerShortname,
    required this.playerDesigination,
  });
  late final String lastMachPlayed;
  late final String id;
  late final String playerPoints;
  late final String selectionPercent;
  late final String matchid;
  late final String teamid;
  late final String playerid;
  late final String isSelect;
  late final String teamName;
  late final String teamImage;
  late final String teamShortName;
  late final String creditPoints;
  late final String name;
  late final String image;
  late final String title;
  late final String shortTerm;
  late final String designationid;
  late final String playingStatus;
  late final String teamNumber;
  late final String playerShortname;
  late final String playerDesigination;
  
  SquadPlayer.fromJson(Map<String, dynamic> json){
    lastMachPlayed=json['last_match_played'].toString();
    id = json['id'];
    playerPoints = json['player_points'];
    selectionPercent = json['selection_percent'];
    matchid = json['matchid'];
    teamid = json['teamid'];
    playerid = json['playerid'];
    isSelect = json['is_select'];
    teamName = json['team_name'];
    teamImage = json['team_image'];
    teamShortName = json['team_short_name'];
    creditPoints = json['credit_points'];
    name = json['name'];
    image = json['image'];
    title = json['title'];
    shortTerm = json['short_term'];
    designationid = json['designationid'];
    playingStatus = json['playing_status'];
    teamNumber = json['team_number'];
    playerShortname = json['player_shortname'];
    playerDesigination = json['player_desigination'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['last_match_played']=lastMachPlayed;
    _data['id'] = id;
    _data['player_points'] = playerPoints;
    _data['selection_percent'] = selectionPercent;
    _data['matchid'] = matchid;
    _data['teamid'] = teamid;
    _data['playerid'] = playerid;
    _data['is_select'] = isSelect;
    _data['team_name'] = teamName;
    _data['team_image'] = teamImage;
    _data['team_short_name'] = teamShortName;
    _data['credit_points'] = creditPoints;
    _data['name'] = name;
    _data['image'] = image;
    _data['title'] = title;
    _data['short_term'] = shortTerm;
    _data['designationid'] = designationid;
    _data['playing_status'] = playingStatus;
    _data['team_number'] = teamNumber;
    _data['player_shortname'] = playerShortname;
    _data['player_desigination'] = playerDesigination;
    return _data;
  }
}
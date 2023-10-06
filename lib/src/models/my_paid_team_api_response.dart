class MyPaidTeamApiResponse {
  MyPaidTeamApiResponse({
    required this.status,
    required this.message,
    required this.data,
  });
  late final int status;
  late final String message;
  late final List<MyPaidTeamData> data;
  
  MyPaidTeamApiResponse.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = List.from(json['data']).map((e)=>MyPaidTeamData.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class MyPaidTeamData {
  MyPaidTeamData({
    required this.userId,
    required this.teamid,
    required this.name,
    required this.bat,
    required this.wk,
    required this.bow,
    required this.all,
    required this.captain,
    required this.viceCaptain,
  });
  late final String userId;
  late final String teamid;
  late final String name;
  late final String bat;
  late final String wk;
  late final String bow;
  late final String all;
  late final Captain captain;
  late final ViceCaptain viceCaptain;
  
  MyPaidTeamData.fromJson(Map<String, dynamic> json){
    userId=json['user_id'];
    teamid = json['teamid'];
    name = json['name'];
    bat = json['bat'].toString();
    wk = json['wk'].toString();
    bow = json['bow'].toString();
    all = json['all'].toString();
    captain = Captain.fromJson(json['captain']);
    viceCaptain = ViceCaptain.fromJson(json['vice_captain']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user_id']=userId;
    _data['teamid'] = teamid;
    _data['name'] = name;
    _data['bat'] = bat;
    _data['wk'] = wk;
    _data['bow'] = bow;
    _data['all'] = all;
    _data['captain'] = captain.toJson();
    _data['vice_captain'] = viceCaptain.toJson();
    return _data;
  }
}

class Captain {
  Captain({
    required this.id,
    required this.pid,
    required this.name,
    required this.designationid,
    required this.teamid,
    required this.playingStatus,
    required this.creditPoints,
    required this.points,
    required this.image,
    required this.dob,
    required this.nationality,
    required this.bowls,
    required this.bats,
    required this.createdDate,
    required this.modifiedDate,
    required this.team,
  });
  late final String id;
  late final String pid;
  late final String name;
  late final String designationid;
  late final String teamid;
  late final String playingStatus;
  late final String creditPoints;
  late final String points;
  late final String image;
  late final String dob;
  late final String nationality;
  late final String bowls;
  late final String bats;
  late final String createdDate;
  late final String modifiedDate;
  late final Team team;
  
  Captain.fromJson(Map<String, dynamic> json){
    id = json['id'].toString();
    pid = json['pid'].toString();
    name = json['name'].toString();
    designationid = json['designationid'].toString();
    teamid = json['teamid'].toString();
    playingStatus = json['playing_status'].toString();
    creditPoints = json['credit_points'].toString();
    points = json['points'].toString();
    image = json['image'].toString();
    dob = json['dob'].toString();
    nationality = json['nationality'].toString();
    bowls = json['bowls'].toString();
    bats = json['bats'].toString();
    createdDate = json['created_date'].toString();
    modifiedDate = json['modified_date'].toString();
    team = Team.fromJson(json['team']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['pid'] = pid;
    _data['name'] = name;
    _data['designationid'] = designationid;
    _data['teamid'] = teamid;
    _data['playing_status'] = playingStatus;
    _data['credit_points'] = creditPoints;
    _data['points'] = points;
    _data['image'] = image;
    _data['dob'] = dob;
    _data['nationality'] = nationality;
    _data['bowls'] = bowls;
    _data['bats'] = bats;
    _data['created_date'] = createdDate;
    _data['modified_date'] = modifiedDate;
    _data['team'] = team.toJson();
    return _data;
  }
}

class Team {
  Team({
    required this.teamImage,
    required this.teamShortName,
  });
  late final String teamImage;
  late final String teamShortName;
  
  Team.fromJson(Map<String, dynamic> json){
    teamImage = json['team_image'];
    teamShortName = json['team_short_name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['team_image'] = teamImage;
    _data['team_short_name'] = teamShortName;
    return _data;
  }
}

class ViceCaptain {
  ViceCaptain({
    required this.id,
    required this.pid,
    required this.name,
    required this.designationid,
    required this.teamid,
    required this.playingStatus,
    required this.creditPoints,
    required this.points,
    required this.image,
    required this.dob,
    required this.nationality,
    required this.bowls,
    required this.bats,
    required this.createdDate,
    required this.modifiedDate,
    required this.team,
  });
  late final String id;
  late final String pid;
  late final String name;
  late final String designationid;
  late final String teamid;
  late final String playingStatus;
  late final String creditPoints;
  late final String points;
  late final String image;
  late final String dob;
  late final String nationality;
  late final String bowls;
  late final String bats;
  late final String createdDate;
  late final String modifiedDate;
  late final Team team;
  
  ViceCaptain.fromJson(Map<String, dynamic> json){
    id = json['id'].toString();
    pid = json['pid'].toString();
    name = json['name'].toString();
    designationid = json['designationid'].toString();
    teamid = json['teamid'].toString();
    playingStatus = json['playing_status'].toString();
    creditPoints = json['credit_points'].toString();
    points = json['points'].toString();
    image = json['image'].toString();
    dob = json['dob'].toString();
    nationality = json['nationality'].toString();
    bowls = json['bowls'].toString();
    bats = json['bats'].toString();
    createdDate = json['created_date'].toString();
    modifiedDate = json['modified_date'].toString();
    team = Team.fromJson(json['team']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['pid'] = pid;
    _data['name'] = name;
    _data['designationid'] = designationid;
    _data['teamid'] = teamid;
    _data['playing_status'] = playingStatus;
    _data['credit_points'] = creditPoints;
    _data['points'] = points;
    _data['image'] = image;
    _data['dob'] = dob;
    _data['nationality'] = nationality;
    _data['bowls'] = bowls;
    _data['bats'] = bats;
    _data['created_date'] = createdDate;
    _data['modified_date'] = modifiedDate;
    _data['team'] = team.toJson();
    return _data;
  }
}
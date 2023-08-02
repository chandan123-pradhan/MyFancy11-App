class GetMyMatchesApiResponse {
  GetMyMatchesApiResponse({
    required this.status,
    required this.message,
    required this.data,
  });
  late final int status;
  late final String message;
  late final List<MyMatchModel> data;
  
  GetMyMatchesApiResponse.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = List.from(json['data']).map((e)=>MyMatchModel.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class MyMatchModel {
  MyMatchModel({
    required this.matchId,
    required this.uniqueId,
     this.competitionId,
    required this.squad,
     this.tossWinnerTeam,
     this.winnerTeam,
    required this.teamid1,
    required this.teamid2,
    required this.elevenOut,
    required this.matchStatus,
    required this.matchStarted,
    required this.type,
    required this.time,
    required this.matchDateTime,
    required this.title,
    required this.leagueName,
    required this.refund,
     this.team1Score,
     this.team1Over,
     this.team2Score,
     this.team2Over,
     this.team1ScoreSecondInning,
     this.team1OverSecondInning,
     this.team2ScoreSecondInning,
     this.team2OverSecondInning,
    required this.paymentStatus,
     this.matchStatusNote,
    required this.createdDate,
    required this.modifiedDate,
    required this.cancelled,
    required this.mega,
    required this.team1,
    required this.team2,
    required this.myteamCount,
    required this.contestCount,
  });
  late final String matchId;
  late final String uniqueId;
  late final String? competitionId;
  late final String squad;
  late final Map? tossWinnerTeam;
  late final Map? winnerTeam;
  late final String teamid1;
  late final String teamid2;
  late final String elevenOut;
  late final String matchStatus;
  late final String matchStarted;
  late final String type;
  late final String time;
  late final String matchDateTime;
  late final String title;
  late final String leagueName;
  late final String refund;
  late final String? team1Score;
  late final String? team1Over;
  late final String? team2Score;
  late final String? team2Over;
  late final String? team1ScoreSecondInning;
  late final String? team1OverSecondInning;
  late final String? team2ScoreSecondInning;
  late final String? team2OverSecondInning;
  late final String paymentStatus;
  late final String? matchStatusNote;
  late final String createdDate;
  late final String modifiedDate;
  late final String cancelled;
  late final String mega;
  late final Team1 team1;
  late final Team2 team2;
  late final int myteamCount;
  late final String contestCount;
  
  MyMatchModel.fromJson(Map<String, dynamic> json){
    matchId = json['match_id'];
    uniqueId = json['unique_id'];
    competitionId = json['competitionId'];
    squad = json['squad'];
    tossWinnerTeam = json['tossWinnerTeam'];
    winnerTeam = json['winnerTeam'];
    teamid1 = json['teamid1'];
    teamid2 = json['teamid2'];
    elevenOut = json['eleven_out'];
    matchStatus = json['match_status'];
    matchStarted = json['matchStarted'];
    type = json['type'];
    time = json['time'];
    matchDateTime = json['match_date_time'];
    title = json['title'];
    leagueName = json['league_name'];
    refund = json['refund'];
    team1Score = json['team1Score'];
    team1Over = json['team1Over'];
    team2Score = json['team2Score'];
    team2Over = json['team2Over'];
    team1ScoreSecondInning = json['team1ScoreSecondInning'];
    team1OverSecondInning = json['team1OverSecondInning'];
    team2ScoreSecondInning = json['team2ScoreSecondInning'];
    team2OverSecondInning = json['team2OverSecondInning'];
    paymentStatus = json['payment_status'];
    matchStatusNote = json['matchStatusNote'];
    createdDate = json['created_date'];
    modifiedDate = json['modified_date'];
    cancelled = json['cancelled'];
    mega = json['mega'];
    team1 = Team1.fromJson(json['team1']);
    team2 = Team2.fromJson(json['team2']);
    myteamCount = json['myteam_count'];
    contestCount = json['contest_count'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['match_id'] = matchId;
    _data['unique_id'] = uniqueId;
    _data['competition_id'] = competitionId;
    _data['squad'] = squad;
    _data['toss_winner_team'] = tossWinnerTeam;
    _data['winner_team'] = winnerTeam;
    _data['teamid1'] = teamid1;
    _data['teamid2'] = teamid2;
    _data['eleven_out'] = elevenOut;
    _data['match_status'] = matchStatus;
    _data['matchStarted'] = matchStarted;
    _data['type'] = type;
    _data['time'] = time;
    _data['match_date_time'] = matchDateTime;
    _data['title'] = title;
    _data['league_name'] = leagueName;
    _data['refund'] = refund;
    _data['team1Score'] = team1Score;
    _data['team1Over'] = team1Over;
    _data['team2Score'] = team2Score;
    _data['team2Over'] = team2Over;
    _data['team1Score_secondInning'] = team1ScoreSecondInning;
    _data['team1Over_secondInning'] = team1OverSecondInning;
    _data['team2Score_secondInning'] = team2ScoreSecondInning;
    _data['team2Over_secondInning'] = team2OverSecondInning;
    _data['payment_status'] = paymentStatus;
    _data['match_status_note'] = matchStatusNote;
    _data['created_date'] = createdDate;
    _data['modified_date'] = modifiedDate;
    _data['cancelled'] = cancelled;
    _data['mega'] = mega;
    _data['team1'] = team1.toJson();
    _data['team2'] = team2.toJson();
    _data['myteam_count'] = myteamCount;
    _data['contest_count'] = contestCount;
    return _data;
  }
}

class Team1 {
  Team1({
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
  
  Team1.fromJson(Map<String, dynamic> json){
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

class Team2 {
  Team2({
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
  
  Team2.fromJson(Map<String, dynamic> json){
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
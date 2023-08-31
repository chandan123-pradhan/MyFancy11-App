class LiveMatchUpdateApiResponse {
  LiveMatchUpdateApiResponse({
    required this.status,
    required this.message,
    required this.data,
    required this.commentry,
    required this.scoreboard,
    required this.stats,
  });
  late final int status;
  late final String message;
  late final List<Data> data;
  late final String commentry;
  late final Scoreboard scoreboard;
  late final List<Stats> stats;
  
  LiveMatchUpdateApiResponse.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
    commentry = json['commentry'].toString();
    scoreboard = Scoreboard.fromJson(json['scoreboard']);
    stats = List.from(json['stats']).map((e)=>Stats.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    _data['commentry'] = commentry;
    _data['scoreboard'] = scoreboard.toJson();
    _data['stats'] = stats.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.matchId,
    required this.uniqueId,
    required this.competitionId,
    required this.squad,
    required this.tossWinnerTeam,
    required this.winnerTeam,
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
    required this.team1Score,
    required this.team1Over,
    required this.team2Score,
    required this.team2Over,
    required this.team1ScoreSecondInning,
    required this.team1OverSecondInning,
    required this.team2ScoreSecondInning,
    required this.team2OverSecondInning,
    required this.paymentStatus,
    required this.matchStatusNote,
    required this.createdDate,
    required this.modifiedDate,
    required this.cancelled,
    required this.mega,
    required this.team1,
    required this.team2,
  });
  late final int matchId;
  late final int uniqueId;
  late final String competitionId;
  late final int squad;
  late final String tossWinnerTeam;
  late final String winnerTeam;
  late final String teamid1;
  late final String teamid2;
  late final int elevenOut;
  late final String matchStatus;
  late final String matchStarted;
  late final String type;
  late final String time;
  late final String matchDateTime;
  late final String title;
  late final String leagueName;
  late final int refund;
  late final String team1Score;
  late final String team1Over;
  late final String team2Score;
  late final String team2Over;
  late final String team1ScoreSecondInning;
  late final String team1OverSecondInning;
  late final String team2ScoreSecondInning;
  late final String team2OverSecondInning;
  late final int paymentStatus;
  late final String matchStatusNote;
  late final String createdDate;
  late final String modifiedDate;
  late final int cancelled;
  late final int mega;
  late final Team1 team1;
  late final Team2 team2;
  
  Data.fromJson(Map<String, dynamic> json){
    matchId = json['match_id'];
    uniqueId = json['unique_id'];
    competitionId = json['competition_id'].toString();
    squad = json['squad'];
    tossWinnerTeam = json['toss_winner_team'].toString();
    winnerTeam = json['winner_team'].toString();
    teamid1 = json['teamid1'].toString();
    teamid2 = json['teamid2'].toString();
    elevenOut = json['eleven_out'];
    matchStatus = json['match_status'].toString();
    matchStarted = json['matchStarted'].toString();
    type = json['type'].toString();
    time = json['time'].toString();
    matchDateTime = json['match_date_time'].toString();
    title = json['title'].toString();
    leagueName = json['league_name'].toString();
    refund = json['refund'];
    team1Score = json['team1Score'].toString();
    team1Over = json['team1Over'].toString();
    team2Score = json['team2Score'].toString();
    team2Over = json['team2Over'].toString();
    team1ScoreSecondInning = json['team1Score_secondInning'].toString();
    team1OverSecondInning = json['team1Over_secondInning'].toString();
    team2ScoreSecondInning = json['team2Score_secondInning'].toString();
    team2OverSecondInning = json['team2Over_secondInning'].toString();
    paymentStatus = json['payment_status'];
    matchStatusNote = json['match_status_note'].toString();
    createdDate = json['created_date'];
    modifiedDate = json['modified_date'];
    cancelled = json['cancelled'];
    mega = json['mega'];
    team1 = Team1.fromJson(json['team1']);
    team2 = Team2.fromJson(json['team2']);
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

class Scoreboard {
  Scoreboard({
    required this.batting,
    required this.bowling,
  });
  late final String batting;
  late final String bowling;
  
  Scoreboard.fromJson(Map<String, dynamic> json){
    batting = json['batting'].toString();
    bowling = json['bowling'].toString();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['batting'] = batting;
    _data['bowling'] = bowling;
    return _data;
  }
}

class Stats {
  Stats({
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
  
  Stats.fromJson(Map<String, dynamic> json){
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
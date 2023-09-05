// class LiveMatchUpdateApiResponse {
//   LiveMatchUpdateApiResponse({
//     required this.current,
//     required this.status,
//     required this.message,
//     required this.data,
//     required this.commentry,
//     required this.scoreboard,
//     required this.stats,
//   });
//   late final List<Current> current;
//   late final int status;
//   late final String message;
//   late final List<Data> data;
//   late final List<Commentry> commentry;
//   late final Scoreboard scoreboard;
//   late final List<Stats> stats;
  
//   LiveMatchUpdateApiResponse.fromJson(Map<String, dynamic> d){
//     current = List.from(d['current']).map((e)=>Current.fromJson(e)).toList();
//     status = d['status'];
//     message = d['message'];
//     data = List.from(d['data']).map((e)=>Data.fromJson(e)).toList();
//     commentry = List.from(d['commentry']).map((e)=>Commentry.fromJson(e)).toList();
//     scoreboard = Scoreboard.fromJson(d['scoreboard']);
//     stats = List.from(d['stats']).map((e)=>Stats.fromJson(e)).toList();
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['current'] = current.map((e)=>e.toJson()).toList();
//     _data['status'] = status;
//     _data['message'] = message;
//     _data['data'] = data.map((e)=>e.toJson()).toList();
//     _data['commentry'] = commentry.map((e)=>e.toJson()).toList();
//     _data['scoreboard'] = scoreboard.toJson();
//     _data['stats'] = stats.map((e)=>e.toJson()).toList();
//     return _data;
//   }
// }

// class Current {
//   Current({
//     required this.batsman,
//     required this.strik,
//     required this.bowler,
//   });
//   late final Batsman batsman;
//   late final Strik strik;
//   late final Bowler bowler;
  
//   Current.fromJson(Map<String, dynamic> json){
//     batsman = Batsman.fromJson(json['batsman']);
//     strik = Strik.fromJson(json['strik']);
//     bowler = Bowler.fromJson(json['bowler']);
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['batsman'] = batsman.toJson();
//     _data['strik'] = strik.toJson();
//     _data['bowler'] = bowler.toJson();
//     return _data;
//   }
// }

// class Batsman {
//   Batsman({
//     required this.resource,
//     required this.id,
//     required this.countryId,
//     required this.firstname,
//     required this.lastname,
//     required this.fullname,
//     required this.imagePath,
//     required this.dateofbirth,
//     required this.gender,
//     required this.battingstyle,
//     required this.bowlingstyle,
//     required this.position,
//     required this.updatedAt,
//   });
//   late final String resource;
//   late final int id;
//   late final int countryId;
//   late final String firstname;
//   late final String lastname;
//   late final String fullname;
//   late final String imagePath;
//   late final String dateofbirth;
//   late final String gender;
//   late final String battingstyle;
//   late final String bowlingstyle;
//   late final Position position;
//   late final String updatedAt;
  
//   Batsman.fromJson(Map<String, dynamic> json){
//     resource = json['resource'];
//     id = json['id'];
//     countryId = json['country_id'];
//     firstname = json['firstname'];
//     lastname = json['lastname'];
//     fullname = json['fullname'];
//     imagePath = json['image_path'];
//     dateofbirth = json['dateofbirth'];
//     gender = json['gender'];
//     battingstyle = json['battingstyle'];
//     bowlingstyle = json['bowlingstyle'];
//     position = Position.fromJson(json['position']);
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['resource'] = resource;
//     _data['id'] = id;
//     _data['country_id'] = countryId;
//     _data['firstname'] = firstname;
//     _data['lastname'] = lastname;
//     _data['fullname'] = fullname;
//     _data['image_path'] = imagePath;
//     _data['dateofbirth'] = dateofbirth;
//     _data['gender'] = gender;
//     _data['battingstyle'] = battingstyle;
//     _data['bowlingstyle'] = bowlingstyle;
//     _data['position'] = position.toJson();
//     _data['updated_at'] = updatedAt;
//     return _data;
//   }
// }

// class Position {
//   Position({
//     required this.resource,
//     required this.id,
//     required this.name,
//   });
//   late final String resource;
//   late final int id;
//   late final String name;
  
//   Position.fromJson(Map<String, dynamic> json){
//     resource = json['resource'];
//     id = json['id'];
//     name = json['name'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['resource'] = resource;
//     _data['id'] = id;
//     _data['name'] = name;
//     return _data;
//   }
// }

// class Strik {
//   Strik({
//     required this.id,
//     required this.pid,
//     required this.name,
//     required this.designationid,
//     required this.teamid,
//     required this.playingStatus,
//     required this.creditPoints,
//     required this.points,
//     required this.image,
//     required this.dob,
//     required this.nationality,
//     required this.bowls,
//     required this.bats,
//     required this.createdDate,
//     required this.modifiedDate,
//   });
//   late final String id;
//   late final String pid;
//   late final String name;
//   late final String designationid;
//   late final String teamid;
//   late final String playingStatus;
//   late final String creditPoints;
//   late final String points;
//   late final String image;
//   late final String dob;
//   late final String nationality;
//   late final String bowls;
//   late final String bats;
//   late final String createdDate;
//   late final String modifiedDate;
  
//   Strik.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     pid = json['pid'];
//     name = json['name'];
//     designationid = json['designationid'];
//     teamid = json['teamid'];
//     playingStatus = json['playing_status'];
//     creditPoints = json['credit_points'];
//     points = json['points'];
//     image = json['image'];
//     dob = json['dob'];
//     nationality = json['nationality'];
//     bowls = json['bowls'];
//     bats = json['bats'];
//     createdDate = json['created_date'];
//     modifiedDate = json['modified_date'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['pid'] = pid;
//     _data['name'] = name;
//     _data['designationid'] = designationid;
//     _data['teamid'] = teamid;
//     _data['playing_status'] = playingStatus;
//     _data['credit_points'] = creditPoints;
//     _data['points'] = points;
//     _data['image'] = image;
//     _data['dob'] = dob;
//     _data['nationality'] = nationality;
//     _data['bowls'] = bowls;
//     _data['bats'] = bats;
//     _data['created_date'] = createdDate;
//     _data['modified_date'] = modifiedDate;
//     return _data;
//   }
// }

// class Bowler {
//   Bowler({
//     required this.resource,
//     required this.id,
//     required this.countryId,
//     required this.firstname,
//     required this.lastname,
//     required this.fullname,
//     required this.imagePath,
//     required this.dateofbirth,
//     required this.gender,
//     required this.battingstyle,
//     required this.bowlingstyle,
//     required this.position,
//     required this.updatedAt,
//   });
//   late final String resource;
//   late final int id;
//   late final int countryId;
//   late final String firstname;
//   late final String lastname;
//   late final String fullname;
//   late final String imagePath;
//   late final String dateofbirth;
//   late final String gender;
//   late final String battingstyle;
//   late final String bowlingstyle;
//   late final Position position;
//   late final String updatedAt;
  
//   Bowler.fromJson(Map<String, dynamic> json){
//     resource = json['resource'];
//     id = json['id'];
//     countryId = json['country_id'];
//     firstname = json['firstname'];
//     lastname = json['lastname'];
//     fullname = json['fullname'];
//     imagePath = json['image_path'];
//     dateofbirth = json['dateofbirth'];
//     gender = json['gender'];
//     battingstyle = json['battingstyle'];
//     bowlingstyle = json['bowlingstyle'];
//     position = Position.fromJson(json['position']);
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['resource'] = resource;
//     _data['id'] = id;
//     _data['country_id'] = countryId;
//     _data['firstname'] = firstname;
//     _data['lastname'] = lastname;
//     _data['fullname'] = fullname;
//     _data['image_path'] = imagePath;
//     _data['dateofbirth'] = dateofbirth;
//     _data['gender'] = gender;
//     _data['battingstyle'] = battingstyle;
//     _data['bowlingstyle'] = bowlingstyle;
//     _data['position'] = position.toJson();
//     _data['updated_at'] = updatedAt;
//     return _data;
//   }
// }

// class Data {
//   Data({
//     required this.matchId,
//     required this.uniqueId,
//      this.competitionId,
//     required this.squad,
//     required this.tossWinnerTeam,
//     required this.winnerTeam,
//     required this.teamid1,
//     required this.teamid2,
//     required this.elevenOut,
//     required this.matchStatus,
//     required this.matchStarted,
//     required this.type,
//     required this.time,
//     required this.matchDateTime,
//     required this.title,
//     required this.leagueName,
//     required this.refund,
//     required this.team1Score,
//     required this.team1Over,
//     required this.team2Score,
//     required this.team2Over,
//      this.team1ScoreSecondInning,
//      this.team1OverSecondInning,
//      this.team2ScoreSecondInning,
//      this.team2OverSecondInning,
//     required this.paymentStatus,
//     required this.matchStatusNote,
//     required this.createdDate,
//     required this.modifiedDate,
//     required this.cancelled,
//     required this.mega,
//     required this.team1,
//     required this.team2,
//   });
//   late final int matchId;
//   late final int uniqueId;
//   late final Null competitionId;
//   late final int squad;
//   late final String tossWinnerTeam;
//   late final String winnerTeam;
//   late final String teamid1;
//   late final String teamid2;
//   late final int elevenOut;
//   late final String matchStatus;
//   late final String matchStarted;
//   late final String type;
//   late final String time;
//   late final String matchDateTime;
//   late final String title;
//   late final String leagueName;
//   late final int refund;
//   late final String team1Score;
//   late final String team1Over;
//   late final String team2Score;
//   late final String team2Over;
//   late final Null team1ScoreSecondInning;
//   late final Null team1OverSecondInning;
//   late final Null team2ScoreSecondInning;
//   late final Null team2OverSecondInning;
//   late final int paymentStatus;
//   late final String matchStatusNote;
//   late final String createdDate;
//   late final String modifiedDate;
//   late final int cancelled;
//   late final int mega;
//   late final Team1 team1;
//   late final Team2 team2;
  
//   Data.fromJson(Map<String, dynamic> json){
//     matchId = json['match_id'];
//     uniqueId = json['unique_id'];
//     competitionId = null;
//     squad = json['squad'];
//     tossWinnerTeam = json['toss_winner_team'];
//     winnerTeam = json['winner_team'];
//     teamid1 = json['teamid1'];
//     teamid2 = json['teamid2'];
//     elevenOut = json['eleven_out'];
//     matchStatus = json['match_status'];
//     matchStarted = json['matchStarted'];
//     type = json['type'];
//     time = json['time'];
//     matchDateTime = json['match_date_time'];
//     title = json['title'];
//     leagueName = json['league_name'];
//     refund = json['refund'];
//     team1Score = json['team1Score'];
//     team1Over = json['team1Over'];
//     team2Score = json['team2Score'];
//     team2Over = json['team2Over'];
//     team1ScoreSecondInning = null;
//     team1OverSecondInning = null;
//     team2ScoreSecondInning = null;
//     team2OverSecondInning = null;
//     paymentStatus = json['payment_status'];
//     matchStatusNote = json['match_status_note'];
//     createdDate = json['created_date'];
//     modifiedDate = json['modified_date'];
//     cancelled = json['cancelled'];
//     mega = json['mega'];
//     team1 = Team1.fromJson(json['team1']);
//     team2 = Team2.fromJson(json['team2']);
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['match_id'] = matchId;
//     _data['unique_id'] = uniqueId;
//     _data['competition_id'] = competitionId;
//     _data['squad'] = squad;
//     _data['toss_winner_team'] = tossWinnerTeam;
//     _data['winner_team'] = winnerTeam;
//     _data['teamid1'] = teamid1;
//     _data['teamid2'] = teamid2;
//     _data['eleven_out'] = elevenOut;
//     _data['match_status'] = matchStatus;
//     _data['matchStarted'] = matchStarted;
//     _data['type'] = type;
//     _data['time'] = time;
//     _data['match_date_time'] = matchDateTime;
//     _data['title'] = title;
//     _data['league_name'] = leagueName;
//     _data['refund'] = refund;
//     _data['team1Score'] = team1Score;
//     _data['team1Over'] = team1Over;
//     _data['team2Score'] = team2Score;
//     _data['team2Over'] = team2Over;
//     _data['team1Score_secondInning'] = team1ScoreSecondInning;
//     _data['team1Over_secondInning'] = team1OverSecondInning;
//     _data['team2Score_secondInning'] = team2ScoreSecondInning;
//     _data['team2Over_secondInning'] = team2OverSecondInning;
//     _data['payment_status'] = paymentStatus;
//     _data['match_status_note'] = matchStatusNote;
//     _data['created_date'] = createdDate;
//     _data['modified_date'] = modifiedDate;
//     _data['cancelled'] = cancelled;
//     _data['mega'] = mega;
//     _data['team1'] = team1.toJson();
//     _data['team2'] = team2.toJson();
//     return _data;
//   }
// }

// class Team1 {
//   Team1({
//     required this.teamId,
//     required this.uniqueId,
//     required this.teamName,
//     required this.teamShortName,
//     required this.teamImage,
//     required this.modifiedDate,
//   });
//   late final String teamId;
//   late final String uniqueId;
//   late final String teamName;
//   late final String teamShortName;
//   late final String teamImage;
//   late final String modifiedDate;
  
//   Team1.fromJson(Map<String, dynamic> json){
//     teamId = json['team_id'];
//     uniqueId = json['unique_id'];
//     teamName = json['team_name'];
//     teamShortName = json['team_short_name'];
//     teamImage = json['team_image'];
//     modifiedDate = json['modified_date'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['team_id'] = teamId;
//     _data['unique_id'] = uniqueId;
//     _data['team_name'] = teamName;
//     _data['team_short_name'] = teamShortName;
//     _data['team_image'] = teamImage;
//     _data['modified_date'] = modifiedDate;
//     return _data;
//   }
// }

// class Team2 {
//   Team2({
//     required this.teamId,
//     required this.uniqueId,
//     required this.teamName,
//     required this.teamShortName,
//     required this.teamImage,
//     required this.modifiedDate,
//   });
//   late final String teamId;
//   late final String uniqueId;
//   late final String teamName;
//   late final String teamShortName;
//   late final String teamImage;
//   late final String modifiedDate;
  
//   Team2.fromJson(Map<String, dynamic> json){
//     teamId = json['team_id'];
//     uniqueId = json['unique_id'];
//     teamName = json['team_name'];
//     teamShortName = json['team_short_name'];
//     teamImage = json['team_image'];
//     modifiedDate = json['modified_date'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['team_id'] = teamId;
//     _data['unique_id'] = uniqueId;
//     _data['team_name'] = teamName;
//     _data['team_short_name'] = teamShortName;
//     _data['team_image'] = teamImage;
//     _data['modified_date'] = modifiedDate;
//     return _data;
//   }
// }

// class Commentry {
//   Commentry({
//     required this.resource,
//     required this.id,
//     required this.fixtureId,
//     required this.teamId,
//     required this.ball,
//     required this.scoreboard,
//     required this.batsmanOneOnCreezeId,
//     required this.batsmanTwoOnCreezeId,
//     required this.batsmanId,
//     required this.bowlerId,
//      this.batsmanoutId,
//      this.catchstumpId,
//      this.runoutById,
//     required this.scoreId,
//     required this.batsman,
//     required this.bowler,
//     required this.score,
//     required this.team,
//     required this.updatedAt,
//   });
//   late final String resource;
//   late final int id;
//   late final int fixtureId;
//   late final int teamId;
//   late final double ball;
//   late final String scoreboard;
//   late final int batsmanOneOnCreezeId;
//   late final int batsmanTwoOnCreezeId;
//   late final int batsmanId;
//   late final int bowlerId;
//   late final int? batsmanoutId;
//   late final int? catchstumpId;
//   late final Null runoutById;
//   late final int scoreId;
//   late final Batsman batsman;
//   late final Bowler bowler;
//   late final Score score;
//   late final Team team;
//   late final String updatedAt;
  
//   Commentry.fromJson(Map<String, dynamic> json){
//     resource = json['resource'];
//     id = json['id'];
//     fixtureId = json['fixture_id'];
//     teamId = json['team_id'];
//     ball = json['ball'];
//     scoreboard = json['scoreboard'];
//     batsmanOneOnCreezeId = json['batsman_one_on_creeze_id'];
//     batsmanTwoOnCreezeId = json['batsman_two_on_creeze_id'];
//     batsmanId = json['batsman_id'];
//     bowlerId = json['bowler_id'];
//     batsmanoutId = null;
//     catchstumpId = null;
//     runoutById = null;
//     scoreId = json['score_id'];
//     batsman = Batsman.fromJson(json['batsman']);
//     bowler = Bowler.fromJson(json['bowler']);
//     score = Score.fromJson(json['score']);
//     team = Team.fromJson(json['team']);
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['resource'] = resource;
//     _data['id'] = id;
//     _data['fixture_id'] = fixtureId;
//     _data['team_id'] = teamId;
//     _data['ball'] = ball;
//     _data['scoreboard'] = scoreboard;
//     _data['batsman_one_on_creeze_id'] = batsmanOneOnCreezeId;
//     _data['batsman_two_on_creeze_id'] = batsmanTwoOnCreezeId;
//     _data['batsman_id'] = batsmanId;
//     _data['bowler_id'] = bowlerId;
//     _data['batsmanout_id'] = batsmanoutId;
//     _data['catchstump_id'] = catchstumpId;
//     _data['runout_by_id'] = runoutById;
//     _data['score_id'] = scoreId;
//     _data['batsman'] = batsman.toJson();
//     _data['bowler'] = bowler.toJson();
//     _data['score'] = score.toJson();
//     _data['team'] = team.toJson();
//     _data['updated_at'] = updatedAt;
//     return _data;
//   }
// }

// class Score {
//   Score({
//     required this.resource,
//     required this.id,
//     required this.name,
//     required this.runs,
//     required this.four,
//     required this.six,
//     required this.bye,
//     required this.legBye,
//     required this.noball,
//     required this.noballRuns,
//     required this.isWicket,
//     required this.ball,
//     required this.out,
//   });
//   late final String resource;
//   late final int id;
//   late final String name;
//   late final int runs;
//   late final bool four;
//   late final bool six;
//   late final int bye;
//   late final int legBye;
//   late final int noball;
//   late final int noballRuns;
//   late final bool isWicket;
//   late final bool ball;
//   late final bool out;
  
//   Score.fromJson(Map<String, dynamic> json){
//     resource = json['resource'];
//     id = json['id'];
//     name = json['name'];
//     runs = json['runs'];
//     four = json['four'];
//     six = json['six'];
//     bye = json['bye'];
//     legBye = json['leg_bye'];
//     noball = json['noball'];
//     noballRuns = json['noball_runs'];
//     isWicket = json['is_wicket'];
//     ball = json['ball'];
//     out = json['out'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['resource'] = resource;
//     _data['id'] = id;
//     _data['name'] = name;
//     _data['runs'] = runs;
//     _data['four'] = four;
//     _data['six'] = six;
//     _data['bye'] = bye;
//     _data['leg_bye'] = legBye;
//     _data['noball'] = noball;
//     _data['noball_runs'] = noballRuns;
//     _data['is_wicket'] = isWicket;
//     _data['ball'] = ball;
//     _data['out'] = out;
//     return _data;
//   }
// }

// class Team {
//   Team({
//     required this.resource,
//     required this.id,
//     required this.name,
//     required this.code,
//     required this.imagePath,
//     required this.countryId,
//     required this.nationalTeam,
//     required this.updatedAt,
//   });
//   late final String resource;
//   late final int id;
//   late final String name;
//   late final String code;
//   late final String imagePath;
//   late final int countryId;
//   late final bool nationalTeam;
//   late final String updatedAt;
  
//   Team.fromJson(Map<String, dynamic> json){
//     resource = json['resource'];
//     id = json['id'];
//     name = json['name'];
//     code = json['code'];
//     imagePath = json['image_path'];
//     countryId = json['country_id'];
//     nationalTeam = json['national_team'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['resource'] = resource;
//     _data['id'] = id;
//     _data['name'] = name;
//     _data['code'] = code;
//     _data['image_path'] = imagePath;
//     _data['country_id'] = countryId;
//     _data['national_team'] = nationalTeam;
//     _data['updated_at'] = updatedAt;
//     return _data;
//   }
// }

// class Scoreboard {
//   Scoreboard({
//     required this.batting,
//     required this.bowling,
//   });
//   late final List<Batting> batting;
//   late final List<Bowling> bowling;
  
//   Scoreboard.fromJson(Map<String, dynamic> json){
//     batting = List.from(json['batting']).map((e)=>Batting.fromJson(e)).toList();
//     bowling = List.from(json['bowling']).map((e)=>Bowling.fromJson(e)).toList();
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['batting'] = batting.map((e)=>e.toJson()).toList();
//     _data['bowling'] = bowling.map((e)=>e.toJson()).toList();
//     return _data;
//   }
// }

// class Batting {
//   Batting({
//     required this.resource,
//     required this.id,
//     required this.sort,
//     required this.fixtureId,
//     required this.teamId,
//     required this.active,
//     required this.scoreboard,
//     required this.playerId,
//     required this.ball,
//     required this.scoreId,
//     required this.score,
//     required this.fourX,
//     required this.sixX,
//      this.catchStumpPlayerId,
//      this.runoutById,
//      this.batsmanoutId,
//      this.bowlingPlayerId,
//     required this.fowScore,
//     required this.fowBalls,
//     required this.rate,
//     required this.updatedAt,
//   });
//   late final String resource;
//   late final int id;
//   late final int sort;
//   late final int fixtureId;
//   late final int teamId;
//   late final bool active;
//   late final String scoreboard;
//   late final int playerId;
//   late final int ball;
//   late final int scoreId;
//   late final int score;
//   late final int fourX;
//   late final int sixX;
//   late final int? catchStumpPlayerId;
//   late final Null runoutById;
//   late final Null batsmanoutId;
//   late final int? bowlingPlayerId;
//   late final int fowScore;
//   late final double? fowBalls;
//   late final int rate;
//   late final String updatedAt;
  
//   Batting.fromJson(Map<String, dynamic> json){
//     resource = json['resource'];
//     id = json['id'];
//     sort = json['sort'];
//     fixtureId = json['fixture_id'];
//     teamId = json['team_id'];
//     active = json['active'];
//     scoreboard = json['scoreboard'];
//     playerId = json['player_id'];
//     ball = json['ball'];
//     scoreId = json['score_id'];
//     score = json['score'];
//     fourX = json['four_x'];
//     sixX = json['six_x'];
//     catchStumpPlayerId = null;
//     runoutById = null;
//     batsmanoutId = null;
//     bowlingPlayerId = null;
//     fowScore = json['fow_score'];
//     fowBalls = json['fow_balls'];
//     rate = json['rate'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['resource'] = resource;
//     _data['id'] = id;
//     _data['sort'] = sort;
//     _data['fixture_id'] = fixtureId;
//     _data['team_id'] = teamId;
//     _data['active'] = active;
//     _data['scoreboard'] = scoreboard;
//     _data['player_id'] = playerId;
//     _data['ball'] = ball;
//     _data['score_id'] = scoreId;
//     _data['score'] = score;
//     _data['four_x'] = fourX;
//     _data['six_x'] = sixX;
//     _data['catch_stump_player_id'] = catchStumpPlayerId;
//     _data['runout_by_id'] = runoutById;
//     _data['batsmanout_id'] = batsmanoutId;
//     _data['bowling_player_id'] = bowlingPlayerId;
//     _data['fow_score'] = fowScore;
//     _data['fow_balls'] = fowBalls;
//     _data['rate'] = rate;
//     _data['updated_at'] = updatedAt;
//     return _data;
//   }
// }

// class Bowling {
//   Bowling({
//     required this.resource,
//     required this.id,
//     required this.sort,
//     required this.fixtureId,
//     required this.teamId,
//     required this.active,
//     required this.scoreboard,
//     required this.playerId,
//     required this.overs,
//     required this.medians,
//     required this.runs,
//     required this.wickets,
//     required this.wide,
//     required this.noball,
//     required this.rate,
//     required this.updatedAt,
//   });
//   late final String resource;
//   late final int id;
//   late final int sort;
//   late final int fixtureId;
//   late final int teamId;
//   late final bool active;
//   late final String scoreboard;
//   late final int playerId;
//   late final int? overs;
//   late final int medians;
//   late final int runs;
//   late final int wickets;
//   late final int wide;
//   late final int noball;
//   late final double? rate;
//   late final String updatedAt;
  
//   Bowling.fromJson(Map<String, dynamic> json){
//     resource = json['resource'];
//     id = json['id'];
//     sort = json['sort'];
//     fixtureId = json['fixture_id'];
//     teamId = json['team_id'];
//     active = json['active'];
//     scoreboard = json['scoreboard'];
//     playerId = json['player_id'];
//     overs = json['overs'];
//     medians = json['medians'];
//     runs = json['runs'];
//     wickets = json['wickets'];
//     wide = json['wide'];
//     noball = json['noball'];
//     rate = json['rate'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['resource'] = resource;
//     _data['id'] = id;
//     _data['sort'] = sort;
//     _data['fixture_id'] = fixtureId;
//     _data['team_id'] = teamId;
//     _data['active'] = active;
//     _data['scoreboard'] = scoreboard;
//     _data['player_id'] = playerId;
//     _data['overs'] = overs;
//     _data['medians'] = medians;
//     _data['runs'] = runs;
//     _data['wickets'] = wickets;
//     _data['wide'] = wide;
//     _data['noball'] = noball;
//     _data['rate'] = rate;
//     _data['updated_at'] = updatedAt;
//     return _data;
//   }
// }

// class Stats {
//   Stats({
//     required this.id,
//     required this.matchid,
//     required this.teamid,
//     required this.playerid,
//     required this.playingStatus,
//     required this.isSelect,
//     required this.points,
//     required this.selectionPercent,
//     required this.totalPoints,
//     required this.bollingPoints,
//     required this.fieldingPoints,
//     required this.playingScore,
//     required this.secondInningsBatting,
//     required this.secondInningsBolling,
//     required this.secondInningsFielding,
//     required this.designationid,
//     required this.createdDate,
//     required this.modifiedDate,
//     required this.lastMatchPlayed,
//   });
//   late final String id;
//   late final String matchid;
//   late final String teamid;
//   late final String playerid;
//   late final String playingStatus;
//   late final String isSelect;
//   late final String points;
//   late final String selectionPercent;
//   late final String totalPoints;
//   late final String bollingPoints;
//   late final String fieldingPoints;
//   late final String playingScore;
//   late final String secondInningsBatting;
//   late final String secondInningsBolling;
//   late final String secondInningsFielding;
//   late final String designationid;
//   late final String createdDate;
//   late final String modifiedDate;
//   late final String lastMatchPlayed;
  
//   Stats.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     matchid = json['matchid'];
//     teamid = json['teamid'];
//     playerid = json['playerid'];
//     playingStatus = json['playing_status'];
//     isSelect = json['is_select'];
//     points = json['points'];
//     selectionPercent = json['selection_percent'];
//     totalPoints = json['total_points'];
//     bollingPoints = json['bolling_points'];
//     fieldingPoints = json['fielding_points'];
//     playingScore = json['playing_score'];
//     secondInningsBatting = json['second_innings_batting'];
//     secondInningsBolling = json['second_innings_bolling'];
//     secondInningsFielding = json['second_innings_fielding'];
//     designationid = json['designationid'];
//     createdDate = json['created_date'];
//     modifiedDate = json['modified_date'];
//     lastMatchPlayed = json['last_match_played'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['matchid'] = matchid;
//     _data['teamid'] = teamid;
//     _data['playerid'] = playerid;
//     _data['playing_status'] = playingStatus;
//     _data['is_select'] = isSelect;
//     _data['points'] = points;
//     _data['selection_percent'] = selectionPercent;
//     _data['total_points'] = totalPoints;
//     _data['bolling_points'] = bollingPoints;
//     _data['fielding_points'] = fieldingPoints;
//     _data['playing_score'] = playingScore;
//     _data['second_innings_batting'] = secondInningsBatting;
//     _data['second_innings_bolling'] = secondInningsBolling;
//     _data['second_innings_fielding'] = secondInningsFielding;
//     _data['designationid'] = designationid;
//     _data['created_date'] = createdDate;
//     _data['modified_date'] = modifiedDate;
//     _data['last_match_played'] = lastMatchPlayed;
//     return _data;
//   }
// }
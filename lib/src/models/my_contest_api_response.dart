class MyContestApiResponse {
  MyContestApiResponse({
    required this.status,
    required this.message,
    required this.data,
  });
  late final int status;
  late final String message;
  late final List<MyContestData> data;
  
  MyContestApiResponse.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = List.from(json['data']).map((e)=>MyContestData.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class MyContestData {
  MyContestData({
    required this.contestId,
    required this.contestName,
    required this.contestTag,
    required this.winners,
    required this.prizePool,
    required this.totalTeam,
    required this.rank,
    required this.joinTeam,
    required this.entry,
    required this.contestDescription,
    required this.contestNote1,
    required this.contestNote2,
    required this.winningNote,
    required this.matchId,
    required this.type,
    required this.firstPrize,
    required this.winPercent,
    required this.teamUpto,
    required this.contestStatus,
    required this.contestPaid,
    required this.bonusEntry,
    required this.spendEarn,
     this.offer,
  });
  late final String contestId;
  late final String contestName;
  late final String contestTag;
  late final String winners;
  late final String prizePool;
  late final int totalTeam;
  late final String rank;
  late final String joinTeam;
  late final String entry;
  late final String contestDescription;
  late final String contestNote1;
  late final String contestNote2;
  late final String winningNote;
  late final String matchId;
  late final String type;
  late final String firstPrize;
  late final String winPercent;
  late final String teamUpto;
  late final String contestStatus;
  late final String contestPaid;
  late final String bonusEntry;
  late final String spendEarn;
  late final Null offer;
  
  MyContestData.fromJson(Map<String, dynamic> json){
    contestId = json['contest_id'];
    contestName = json['contest_name'];
    contestTag = json['contest_tag'];
    winners = json['winners'];
    prizePool = json['prize_pool'];
    totalTeam = json['total_team'];
    rank=json['rank'].toString();
    joinTeam = json['join_team'];
    entry = json['entry'];
    contestDescription = json['contest_description'];
    contestNote1 = json['contest_note1'];
    contestNote2 = json['contest_note2'];
    winningNote = json['winning_note'];
    matchId = json['match_id'];
    type = json['type'];
    firstPrize = json['first_prize'];
    winPercent = json['win_percent'];
    teamUpto = json['team_upto'];
    contestStatus = json['contest_status'];
    contestPaid = json['contest_paid'];
    bonusEntry = json['bonus_entry'];
    spendEarn = json['spend_earn'];
    offer = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['contest_id'] = contestId;
    _data['contest_name'] = contestName;
    _data['contest_tag'] = contestTag;
    _data['winners'] = winners;
    _data['prize_pool'] = prizePool;
    _data['total_team'] = totalTeam;
    _data['join_team'] = joinTeam;
    _data['entry'] = entry;
    _data['contest_description'] = contestDescription;
    _data['contest_note1'] = contestNote1;
    _data['contest_note2'] = contestNote2;
    _data['winning_note'] = winningNote;
    _data['match_id'] = matchId;
    _data['type'] = type;
    _data['first_prize'] = firstPrize;
    _data['win_percent'] = winPercent;
    _data['team_upto'] = teamUpto;
    _data['contest_status'] = contestStatus;
    _data['contest_paid'] = contestPaid;
    _data['bonus_entry'] = bonusEntry;
    _data['spend_earn'] = spendEarn;
    _data['offer'] = offer;
    return _data;
  }
}
class GetContestListApiResponse {
  GetContestListApiResponse({
    required this.status,
    required this.message,
    required this.contestList,
  });
  late final int status;
  late final String message;
  late final List<ContestList> contestList;

  GetContestListApiResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    contestList =
        List.from(json['data']).map((e) => ContestList.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = contestList.map((e) => e.toJson()).toList();
    return _data;
  }
}

class ContestList {
  ContestList({
    required this.id,
    required this.name,
    required this.status,
    required this.data,
  });
  late final String id;
  late final String name;
  late final String status;
  late final List<Contest> data;

  ContestList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    data = List.from(json['data']).map((e) => Contest.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['status'] = status;
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Contest {
  Contest(
      {required this.contestId,
      required this.contestName,
      required this.contestTag,
      required this.winners,
      required this.prizePool,
      required this.totalTeam,
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
      required this.offer,
      required this.guaranteed});
  late final String contestId;
  late final String contestName;
  late final String contestTag;
  late final String winners;
  late final String prizePool;
  late final String totalTeam;
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
  late final String offer;
  late final String guaranteed;

  Contest.fromJson(Map<String, dynamic> json) {
    contestId = json['contest_id'];
    contestName = json['contest_name'];
    contestTag = json['contest_tag'];
    winners = json['winners'];
    prizePool = json['prize_pool'];
    totalTeam = json['total_team'];
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
    offer = json['offer'].toString();
    guaranteed = json['guarantee'].toString();
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
    _data['guarantee'] = guaranteed;
    return _data;
  }
}

class Offer {
  Offer({
    required this.offerId,
    required this.thumb,
    required this.contestId,
    required this.comment,
    required this.status,
    required this.title,
  });
  late final String offerId;
  late final String thumb;
  late final String contestId;
  late final String comment;
  late final String status;
  late final String title;

  Offer.fromJson(Map<String, dynamic> json) {
    offerId = json['offer_id'];
    thumb = json['thumb'];
    contestId = json['contest_id'];
    comment = json['comment'];
    status = json['status'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['offer_id'] = offerId;
    _data['thumb'] = thumb;
    _data['contest_id'] = contestId;
    _data['comment'] = comment;
    _data['status'] = status;
    _data['title'] = title;
    return _data;
  }
}

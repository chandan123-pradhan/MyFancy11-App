class GetQuizByCategoryApiResponse {
  GetQuizByCategoryApiResponse({
    required this.status,
    required this.message,
    required this.data,
  });
  late final int status;
  late final String message;
  late final List<QuizData> data;
  
  GetQuizByCategoryApiResponse.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = List.from(json['data']).map((e)=>QuizData.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class QuizData {
  QuizData({
    required this.quizId,
    required this.categoryId,
    required this.question,
    required this.option1,
    required this.option2,
    required this.note,
    required this.details,
    required this.date,
    required this.time,
    required this.icon,
    required this.updatedAt,
    required this.status,
    required this.totalTrade,
  });
  late final String quizId;
  late final String categoryId;
  late final String question;
  late final String option1;
  late final String option2;
  late final String note;
  late final String details;
  late final String date;
  late final String time;
  late final String icon;
  late final String updatedAt;
  late final String status;
  late final int totalTrade;
  
  QuizData.fromJson(Map<String, dynamic> json){
    quizId = json['quiz_id'];
    categoryId = json['category_id'];
    question = json['question'];
    option1 = json['option1'];
    option2 = json['option2'];
    note = json['note'];
    details = json['details'];
    date = json['date'];
    time = json['time'];
    icon = json['icon'];
    updatedAt = json['updated_at'];
    status = json['status'];
    totalTrade = json['total_trade'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['quiz_id'] = quizId;
    _data['category_id'] = categoryId;
    _data['question'] = question;
    _data['option1'] = option1;
    _data['option2'] = option2;
    _data['note'] = note;
    _data['details'] = details;
    _data['date'] = date;
    _data['time'] = time;
    _data['icon'] = icon;
    _data['updated_at'] = updatedAt;
    _data['status'] = status;
    _data['total_trade'] = totalTrade;
    return _data;
  }
}
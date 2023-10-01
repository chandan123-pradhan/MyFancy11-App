class GetQuizMyListApiResponse {
  GetQuizMyListApiResponse({
    required this.status,
    required this.message,
    required this.trad,
    required this.data,
  });
  late final int status;
  late final String message;
  late final Trad trad;
  late final List<MyQuizData> data;
  
  GetQuizMyListApiResponse.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    trad = Trad.fromJson(json['trad']);
    data = List.from(json['data']).map((e)=>MyQuizData.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['trad'] = trad.toJson();
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Trad {
  Trad({
    required this.amount,
    required this.win,
    required this.pl,
  });
  late final String amount;
  late final String win;
  late final String pl;
  
  Trad.fromJson(Map<String, dynamic> json){
    amount = json['amount'].toString();
    win = json['win'].toString();
    pl = json['pl'].toStringAsFixed(2);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['amount'] = amount;
    _data['win'] = win;
    _data['pl'] = pl;
    return _data;
  }
}

class MyQuizData {
  MyQuizData({
    required this.quizId,
    required this.question,
    required this.myOption,
    required this.joinId,
    required this.pl,
    required this.amount,
    required this.qty,
    required this.win,
    required this.price,
    required this.status,
  });
  late final String quizId;
  late final String question;
  late final String myOption;
  late final String joinId;
  late final String pl;
  late final String amount;
  late final String qty;
  late final String win;
  late final String price;
  late final String status;
  
  MyQuizData.fromJson(Map<String, dynamic> json){
    quizId = json['quiz_id'];
    question = json['question'];
    myOption = json['my_option'];
    joinId=json['join_id'].toString();
    pl = json['pl'].toStringAsFixed(2);
    amount = json['amount'];
    qty = json['qty'];
    win = json['win'].toString();
    price = json['price'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['quiz_id'] = quizId;
    _data['question'] = question;
    _data['my_option'] = myOption;
    _data['join_id']=joinId;
    _data['pl'] = pl;
    _data['amount'] = amount;
    _data['qty'] = qty;
    _data['win'] = win;
    _data['price'] = price;
    _data['status'] = status;
    return _data;
  }
}
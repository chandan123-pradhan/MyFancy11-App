class GetNotificationApiResponse {
  GetNotificationApiResponse({
    required this.status,
    required this.message,
    required this.data,
  });
  late final int status;
  late final String message;
  late final List<Data> data;
  
  GetNotificationApiResponse.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.userToken,
    required this.title,
    required this.htmlDesc,
    required this.thumb,
    required this.date,
  });
  late final String id;
  late final String userToken;
  late final String title;
  late final String htmlDesc;
  late final String thumb;
  late final String date;
  
  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    userToken = json['user_token'];
    title = json['title'];
    htmlDesc = json['html_desc'];
    thumb = json['thumb'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user_token'] = userToken;
    _data['title'] = title;
    _data['html_desc'] = htmlDesc;
    _data['thumb'] = thumb;
    _data['date'] = date;
    return _data;
  }
}
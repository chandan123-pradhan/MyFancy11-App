class GetQuizCategoryApiResponse {
  GetQuizCategoryApiResponse({
    required this.status,
    required this.message,
    required this.data,
  });
  late final int status;
  late final String message;
  late final List<Data> data;
  
  GetQuizCategoryApiResponse.fromJson(Map<String, dynamic> json){
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
    required this.categoryId,
    required this.title,
    required this.icon,
    required this.status,
  });
  late final String categoryId;
  late final String title;
  late final String icon;
  late final String status;
  
  Data.fromJson(Map<String, dynamic> json){
    categoryId = json['category_id'];
    title = json['title'];
    icon = json['icon'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['category_id'] = categoryId;
    _data['title'] = title;
    _data['icon'] = icon;
    _data['status'] = status;
    return _data;
  }
}
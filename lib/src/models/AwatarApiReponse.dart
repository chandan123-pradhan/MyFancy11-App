class AwatarListApiResponse {
  AwatarListApiResponse({
    required this.status,
    required this.message,
    required this.data,
  });
  late final int status;
  late final String message;
  late final List<AwatarList> data;
  
  AwatarListApiResponse.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = List.from(json['data']).map((e)=>AwatarList.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class AwatarList {
  AwatarList({
    required this.id,
    required this.name,
    required this.avatar,
    required this.status,
  });
  late final String id;
  late final String name;
  late final String avatar;
  late final String status;
  
  AwatarList.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    avatar = json['avatar'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['avatar'] = avatar;
    _data['status'] = status;
    return _data;
  }
}
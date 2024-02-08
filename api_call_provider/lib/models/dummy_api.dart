
class DummyApi {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<Data>? data;
  Support? support;

  DummyApi({this.page, this.perPage, this.total, this.totalPages, this.data, this.support});

  DummyApi.fromJson(Map<String, dynamic> json) {
    page = json["page"];
    perPage = json["per_page"];
    total = json["total"];
    totalPages = json["total_pages"];
    data = json["data"] == null ? null : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
    support = json["support"] == null ? null : Support.fromJson(json["support"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["page"] = page;
    _data["per_page"] = perPage;
    _data["total"] = total;
    _data["total_pages"] = totalPages;
    if(data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    if(support != null) {
      _data["support"] = support?.toJson();
    }
    return _data;
  }
}

class Support {
  String? url;
  String? text;

  Support({this.url, this.text});

  Support.fromJson(Map<String, dynamic> json) {
    url = json["url"];
    text = json["text"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["url"] = url;
    _data["text"] = text;
    return _data;
  }
}

class Data {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  Data({this.id, this.email, this.firstName, this.lastName, this.avatar});

  Data.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    email = json["email"];
    firstName = json["first_name"];
    lastName = json["last_name"];
    avatar = json["avatar"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["email"] = email;
    _data["first_name"] = firstName;
    _data["last_name"] = lastName;
    _data["avatar"] = avatar;
    return _data;
  }
}
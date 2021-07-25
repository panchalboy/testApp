// To parse this JSON data, do
//
//     final mackupModel = mackupModelFromJson(jsonString);

import 'dart:convert';

PostDataModel postDataModelFromJson(String str) => PostDataModel.fromJson(json.decode(str));

String postDataModelToJson(PostDataModel data) => json.encode(data.toJson());

class PostDataModel {
  PostDataModel({
    this.meta,
    this.data,
  });

  Meta? meta;
  List<Data>?data;

  factory PostDataModel.fromJson(Map<String, dynamic> json) => PostDataModel(
    meta: Meta.fromJson(json["meta"]),
    data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "meta": meta?.toJson(),
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Data {
  Data({
    this.id,
    this.name,
    this.email,
    this.gender,
    this.status,
  });

  dynamic id;
  dynamic name;
  dynamic email;
  dynamic gender;
  dynamic status;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    gender: json["gender"]

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "gender":gender


  };
}

enum Gender { FEMALE, MALE }


enum Status { INACTIVE, ACTIVE }



class Meta {
  Meta({
    required this.pagination,
  });

  Pagination pagination;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    pagination: Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "pagination": pagination.toJson(),
  };
}

class Pagination {
  Pagination({
    required this.total,
    required this.pages,
    required this.page,
    required this.limit,
    required this.links,
  });

  int total;
  int pages;
  int page;
  int limit;
  Links links;

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    total: json["total"],
    pages: json["pages"],
    page: json["page"],
    limit: json["limit"],
    links: Links.fromJson(json["links"]),
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "pages": pages,
    "page": page,
    "limit": limit,
    "links": links.toJson(),
  };
}

class Links {
  Links({
    this.previous,
    required this.current,
    required this.next,
  });

  dynamic previous;
  String current;
  String next;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    previous: json["previous"],
    current: json["current"],
    next: json["next"],
  );

  Map<String, dynamic> toJson() => {
    "previous": previous,
    "current": current,
    "next": next,
  };
}


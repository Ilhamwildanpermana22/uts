// To parse this JSON data, do
//
//     final bookData = bookDataFromJson(jsonString);

import 'dart:convert';

BookData bookDataFromJson(String str) => BookData.fromJson(json.decode(str));

String bookDataToJson(BookData data) => json.encode(data.toJson());

class BookData {
  List<Datum> data;
  Meta meta;

  BookData({
    required this.data,
    required this.meta,
  });

  factory BookData.fromJson(Map<String, dynamic> json) => BookData(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "meta": meta.toJson(),
      };
}

class Datum {
  int id;
  Attributes attributes;

  Datum({
    required this.id,
    required this.attributes,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        attributes: Attributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes.toJson(),
      };
}

class Attributes {
  String isi;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime publishedAt;
  String buku;
  String images;

  Attributes({
    required this.isi,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
    required this.buku,
    required this.images,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        isi: json["isi"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
        buku: json["buku"],
        images: json["images"],
      );

  Map<String, dynamic> toJson() => {
        "isi": isi,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "publishedAt": publishedAt.toIso8601String(),
        "buku": buku,
        "images": images,
      };
}

class Meta {
  Pagination pagination;

  Meta({
    required this.pagination,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        pagination: Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "pagination": pagination.toJson(),
      };
}

class Pagination {
  int page;
  int pageSize;
  int pageCount;
  int total;

  Pagination({
    required this.page,
    required this.pageSize,
    required this.pageCount,
    required this.total,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        page: json["page"],
        pageSize: json["pageSize"],
        pageCount: json["pageCount"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "pageSize": pageSize,
        "pageCount": pageCount,
        "total": total,
      };
}

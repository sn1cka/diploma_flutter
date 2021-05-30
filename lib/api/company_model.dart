import 'package:json_annotation/json_annotation.dart';

part 'company_model.g.dart';

@JsonSerializable()
class Company {
  int id;
  String name;
  CompanyContacts contacts;

  Company({required this.id, required this.name, required this.contacts});

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}

@JsonSerializable()
class CompanyContacts {
  int id;
  String? whatsapp;
  String? telegram;
  String? instagram;
  String phone;

  CompanyContacts(
      {required this.id,
      this.whatsapp,
      this.telegram,
      this.instagram,
      required this.phone});

  factory CompanyContacts.fromJson(Map<String, dynamic> json) =>
      _$CompanyContactsFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyContactsToJson(this);
}

@JsonSerializable()
class TourFeed {
  String name;
  String photo;
  String feed;

  TourFeed({required this.name, required this.photo, required this.feed});

  factory TourFeed.fromJson(Map<String, dynamic> json) =>
      _$TourFeedFromJson(json);

  Map<String, dynamic> toJson() => _$TourFeedToJson(this);
}

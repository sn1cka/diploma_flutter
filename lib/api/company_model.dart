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
class CompanyFeed {
  @JsonKey(name: 'company')
  int? companyId;
  int id;
  String name;
  String photo;
  String feed;

  CompanyFeed(
      {this.companyId,
      required this.id,
      required this.name,
      required this.photo,
      required this.feed});

  factory CompanyFeed.fromJson(Map<String, dynamic> json) =>
      _$CompanyFeedFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyFeedToJson(this);
}

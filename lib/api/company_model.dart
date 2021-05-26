import 'package:retrofit/retrofit.dart';
import 'package:json_annotation/json_annotation.dart';

part 'company_model.g.dart';

@JsonSerializable()
class Company {
  String name;
  List<CompanyFeed> companyFeed;
  CompanyContacts contacts;

  Company({required this.name, required this.companyFeed, required this.contacts});

  factory Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);
  Map<String, dynamic> toJson() => _$CompanyToJson(this);

}


@JsonSerializable()
class CompanyContacts {
  String? whatsApp;
  String? telegram;
  String? instagram;
  String telephone;

  CompanyContacts({this.whatsApp, this.telegram, this.instagram, required this.telephone});

  factory CompanyContacts.fromJson(Map<String, dynamic> json) => _$CompanyContactsFromJson(json);
  Map<String, dynamic> toJson() => _$CompanyContactsToJson(this);
}

@JsonSerializable()
class CompanyFeed {
  String name;
  String photo;
  String feed;

  CompanyFeed({required this.name, required this.photo, required this.feed});

  factory CompanyFeed.fromJson(Map<String, dynamic> json) => _$CompanyFeedFromJson(json);
  Map<String, dynamic> toJson() => _$CompanyFeedToJson(this);
}


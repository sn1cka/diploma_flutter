// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Company _$CompanyFromJson(Map<String, dynamic> json) {
  return Company(
    name: json['name'] as String,
    companyFeed: (json['companyFeed'] as List<dynamic>)
        .map((e) => CompanyFeed.fromJson(e as Map<String, dynamic>))
        .toList(),
    contacts:
        CompanyContacts.fromJson(json['contacts'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
      'name': instance.name,
      'companyFeed': instance.companyFeed,
      'contacts': instance.contacts,
    };

CompanyContacts _$CompanyContactsFromJson(Map<String, dynamic> json) {
  return CompanyContacts(
    whatsApp: json['whatsApp'] as String?,
    telegram: json['telegram'] as String?,
    instagram: json['instagram'] as String?,
    telephone: json['telephone'] as String,
  );
}

Map<String, dynamic> _$CompanyContactsToJson(CompanyContacts instance) =>
    <String, dynamic>{
      'whatsApp': instance.whatsApp,
      'telegram': instance.telegram,
      'instagram': instance.instagram,
      'telephone': instance.telephone,
    };

CompanyFeed _$CompanyFeedFromJson(Map<String, dynamic> json) {
  return CompanyFeed(
    name: json['name'] as String,
    photo: json['photo'] as String,
    feed: json['feed'] as String,
  );
}

Map<String, dynamic> _$CompanyFeedToJson(CompanyFeed instance) =>
    <String, dynamic>{
      'name': instance.name,
      'photo': instance.photo,
      'feed': instance.feed,
    };

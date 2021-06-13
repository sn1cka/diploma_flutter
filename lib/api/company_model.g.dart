// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Company _$CompanyFromJson(Map<String, dynamic> json) {
  return Company(
    id: json['id'] as int,
    name: json['name'] as String,
    contacts:
        CompanyContacts.fromJson(json['contacts'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'contacts': instance.contacts,
    };

CompanyContacts _$CompanyContactsFromJson(Map<String, dynamic> json) {
  return CompanyContacts(
    id: json['id'] as int,
    whatsapp: json['whatsapp'] as String?,
    telegram: json['telegram'] as String?,
    instagram: json['instagram'] as String?,
    phone: json['phone'] as String,
  );
}

Map<String, dynamic> _$CompanyContactsToJson(CompanyContacts instance) =>
    <String, dynamic>{
      'id': instance.id,
      'whatsapp': instance.whatsapp,
      'telegram': instance.telegram,
      'instagram': instance.instagram,
      'phone': instance.phone,
    };

CompanyFeed _$CompanyFeedFromJson(Map<String, dynamic> json) {
  return CompanyFeed(
    companyId: json['company'] as int?,
    id: json['id'] as int,
    name: json['name'] as String,
    photo: json['photo'] as String,
    feed: json['feed'] as String,
  );
}

Map<String, dynamic> _$CompanyFeedToJson(CompanyFeed instance) =>
    <String, dynamic>{
      'company': instance.companyId,
      'id': instance.id,
      'name': instance.name,
      'photo': instance.photo,
      'feed': instance.feed,
    };

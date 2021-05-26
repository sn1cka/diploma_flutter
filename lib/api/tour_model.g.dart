// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tour_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tour _$TourFromJson(Map<String, dynamic> json) {
  return Tour(
    photoUrl: json['photoUrl'] as String,
    name: json['name'] as String,
    region: json['region'] as String,
    variants: (json['variants'] as List<dynamic>)
        .map((e) => TourVariant.fromJson(e as Map<String, dynamic>))
        .toList(),
    additionalPhotosUrl: (json['additionalPhotosUrl'] as List<dynamic>)
        .map((e) => e as String)
        .toList(),
  );
}

Map<String, dynamic> _$TourToJson(Tour instance) => <String, dynamic>{
      'photoUrl': instance.photoUrl,
      'region': instance.region,
      'name': instance.name,
      'variants': instance.variants,
      'additionalPhotosUrl': instance.additionalPhotosUrl,
    };

TourVariant _$TourVariantFromJson(Map<String, dynamic> json) {
  return TourVariant(
    company: Company.fromJson(json['company'] as Map<String, dynamic>),
    coast: json['coast'] as int,
    date: json['date'] as String,
    details: TourDetails.fromJson(json['details'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TourVariantToJson(TourVariant instance) =>
    <String, dynamic>{
      'company': instance.company,
      'coast': instance.coast,
      'date': instance.date,
      'details': instance.details,
    };

TourDetails _$TourDetailsFromJson(Map<String, dynamic> json) {
  return TourDetails(
    difficulty: json['difficulty'] as String,
    outTime: json['outTime'] as String,
    backTime: json['backTime'] as String,
    neededItems: json['neededItems'] as String,
  );
}

Map<String, dynamic> _$TourDetailsToJson(TourDetails instance) =>
    <String, dynamic>{
      'difficulty': instance.difficulty,
      'outTime': instance.outTime,
      'backTime': instance.backTime,
      'neededItems': instance.neededItems,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tour_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tour _$TourFromJson(Map<String, dynamic> json) {
  return Tour(
    variants: (json['variants'] as List<dynamic>)
        .map((e) => TourVariant.fromJson(e as Map<String, dynamic>))
        .toList(),
    photo: json['photo'] as String,
    id: json['id'] as int,
    name: json['name'] as String,
    region: json['region'] as String,
    photos: (json['photos'] as List<dynamic>).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$TourToJson(Tour instance) => <String, dynamic>{
      'id': instance.id,
      'photo': instance.photo,
      'name': instance.name,
      'region': instance.region,
      'photos': instance.photos,
      'variants': instance.variants,
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
    out_time: json['out_time'] as String,
    back_time: json['back_time'] as String,
    needed_items: json['needed_items'] as String,
    id: json['id'] as int,
  );
}

Map<String, dynamic> _$TourDetailsToJson(TourDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'difficulty': instance.difficulty,
      'out_time': instance.out_time,
      'back_time': instance.back_time,
      'needed_items': instance.needed_items,
    };

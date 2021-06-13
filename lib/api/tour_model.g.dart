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
    tourId: json['tour'] as int?,
    startHeight: json['start_height'] as int,
    maxHeight: json['max_height'] as int,
    pathLength: json['path_length_m'] as int,
    daysCount: json['days_count'] as int,
    photographer: json['photographer'] as bool,
    id: json['id'] as int,
    difficulty: _$enumDecode(_$DifficultyEnumMap, json['difficulty']),
    backTime: json['back_time'] as String,
    outTime: json['out_time'] as String,
    company: Company.fromJson(json['company'] as Map<String, dynamic>),
    coast: json['coast'] as int,
    neededItems: json['needed_items'] as String,
    date: json['date'] as String,
    details: (json['details'] as List<dynamic>)
        .map((e) => TourDetails.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$TourVariantToJson(TourVariant instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tour': instance.tourId,
      'company': instance.company,
      'coast': instance.coast,
      'date': instance.date,
      'difficulty': _$DifficultyEnumMap[instance.difficulty],
      'out_time': instance.outTime,
      'back_time': instance.backTime,
      'photographer': instance.photographer,
      'start_height': instance.startHeight,
      'max_height': instance.maxHeight,
      'days_count': instance.daysCount,
      'path_length_m': instance.pathLength,
      'details': instance.details,
      'needed_items': instance.neededItems,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$DifficultyEnumMap = {
  Difficulty.EASY: 'EASY',
  Difficulty.MIDDLE: 'MIDDLE',
  Difficulty.HIGH: 'HIGH',
  Difficulty.ADVANCED: 'ADVANCED',
};

TourDetails _$TourDetailsFromJson(Map<String, dynamic> json) {
  return TourDetails(
    title: json['title'] as String,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$TourDetailsToJson(TourDetails instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
    };

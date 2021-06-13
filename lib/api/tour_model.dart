import 'package:flutter_app/api/company_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tour_model.g.dart';

@JsonSerializable()
class Tour {
  int id;
  String photo;
  String name;
  String region;
  List<String> photos;
  List<TourVariant> variants;

  Tour(
      {required this.variants,
      required this.photo,
      required this.id,
      required this.name,
      required this.region,
      required this.photos});

  factory Tour.fromJson(Map<String, dynamic> json) => _$TourFromJson(json);

  Map<String, dynamic> toJson() => _$TourToJson(this);
}

enum Difficulty { EASY, MIDDLE, HIGH, ADVANCED }

String difficultyToStiring(Difficulty difficultyEnum) {
  switch (difficultyEnum) {
    case Difficulty.EASY:
      return 'Легкий';
    case Difficulty.MIDDLE:
      return 'Средний';
    case Difficulty.HIGH:
      return 'Тяжелый';
    case Difficulty.ADVANCED:
      return 'Профессиональный';
  }
}

@JsonSerializable()
class TourVariant {
  int id;
  @JsonKey(name: 'tour')
  int? tourId;
  Company company;
  int coast;

  String date;
  Difficulty difficulty;
  @JsonKey(name: 'out_time')
  String outTime;
  @JsonKey(name: 'back_time')
  String backTime;
  bool photographer;
  @JsonKey(name: 'start_height')
  int startHeight;
  @JsonKey(name: 'max_height')
  int maxHeight;
  @JsonKey(name: 'days_count')
  int daysCount;
  @JsonKey(name: 'path_length_m')
  int pathLength;
  List<TourDetails> details;
  @JsonKey(name: 'needed_items')
  String neededItems;

  TourVariant(
      {this.tourId,
      required this.startHeight,
      required this.maxHeight,
      required this.pathLength,
      required this.daysCount,
      required this.photographer,
      required this.id,
      required this.difficulty,
      required this.backTime,
      required this.outTime,
      required this.company,
      required this.coast,
      required this.neededItems,
      required this.date,
      required this.details});

  factory TourVariant.fromJson(Map<String, dynamic> json) =>
      _$TourVariantFromJson(json);

  Map<String, dynamic> toJson() => _$TourVariantToJson(this);
}

@JsonSerializable()
class TourDetails {
  String title;
  String description;

  TourDetails({required this.title, required this.description});

  factory TourDetails.fromJson(Map<String, dynamic> json) =>
      _$TourDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$TourDetailsToJson(this);
}

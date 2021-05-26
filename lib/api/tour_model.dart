import 'package:retrofit/retrofit.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'company_model.dart';

part 'tour_model.g.dart';

@JsonSerializable()
class Tour {
  String photoUrl;
  String region;
  String name;
  List<TourVariant> variants;
  List<String> additionalPhotosUrl;

  Tour(
      {required this.photoUrl,
      required this.name,
      required this.region,
      required this.variants,
      required this.additionalPhotosUrl});

  factory Tour.fromJson(Map<String, dynamic> json) => _$TourFromJson(json);

  Map<String, dynamic> toJson() => _$TourToJson(this);
}

@JsonSerializable()
class TourVariant {
  Company company;
  int coast;
  String date;
  TourDetails details;

  TourVariant(
      {required this.company, required this.coast, required this.date, required this.details});

  factory TourVariant.fromJson(Map<String, dynamic> json) => _$TourVariantFromJson(json);

  Map<String, dynamic> toJson() => _$TourVariantToJson(this);
}

@JsonSerializable()
class TourDetails {
  String difficulty;
  String outTime;
  String backTime;
  String neededItems;

  TourDetails(
      {required this.difficulty,
      required this.outTime,
      required this.backTime,
      required this.neededItems});

  factory TourDetails.fromJson(Map<String, dynamic> json) => _$TourDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$TourDetailsToJson(this);
}

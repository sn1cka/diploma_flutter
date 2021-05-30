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

@JsonSerializable()
class TourVariant {
  Company company;
  int coast;
  String date;
  TourDetails details;

  TourVariant(
      {required this.company,
      required this.coast,
      required this.date,
      required this.details});

  factory TourVariant.fromJson(Map<String, dynamic> json) =>
      _$TourVariantFromJson(json);

  Map<String, dynamic> toJson() => _$TourVariantToJson(this);
}

@JsonSerializable()
class TourDetails {
  int id;
  String difficulty;

  // ignore: non_constant_identifier_names
  String out_time;

  // ignore: non_constant_identifier_names
  String back_time;

  // ignore: non_constant_identifier_names
  String needed_items;

  TourDetails(
      {required this.difficulty,
      required this.out_time,
      required this.back_time,
      required this.needed_items,
      required this.id});

  factory TourDetails.fromJson(Map<String, dynamic> json) =>
      _$TourDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$TourDetailsToJson(this);
}

//
// class Tour {
//   int id;
//   String photo;
//   String name;
//   String region;
//   List<String> photos;
//   List<TourVariant> variants;
//
//   Tour(
//       {required this.variants,
//         required this.photo,
//         required this.id,
//         required this.name,
//         required this.region,
//         required this.photos});
//
//   factory Tour.fromJson(Map<String, dynamic> json) => _$TourFromJson(json);
//
//   Map<String, dynamic> toJson() => _$TourToJson(this);
// }
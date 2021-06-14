import 'package:json_annotation/json_annotation.dart';

part 'user_response_model.g.dart';

@JsonSerializable()
class ResponseModel {
  String? detail;
  String? username;
  String? password;

  ResponseModel({this.detail, this.username, this.password});

  factory ResponseModel.fromJson(Map<String, dynamic> json) => _$ResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseModelToJson(this);
}

@JsonSerializable()
class TokenResponseModel extends ResponseModel {
  @JsonKey(name: 'refresh')
  String? tokenRefresh;
  @JsonKey(name: 'access')
  String? accessToken;

  TokenResponseModel({this.tokenRefresh, this.accessToken});

  factory TokenResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TokenResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$TokenResponseModelToJson(this);
}

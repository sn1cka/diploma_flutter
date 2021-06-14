import 'package:dio/dio.dart';
import 'package:flutter_app/api/company_model.dart';
import 'package:flutter_app/api/tour_model.dart';
import 'package:flutter_app/api/user_response_model.dart';
import 'package:retrofit/http.dart';

part 'api_caller.g.dart';

@RestApi(baseUrl: 'http://192.168.0.100:8000/')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('api/tours/')
  Future<List<Tour>> getAllTours();

  @GET('api/companies/{id}/feeds/')
  Future<List<CompanyFeed>> getCompanyFeedsById(@Path() int id);

  @POST('api/users/')
  @FormUrlEncoded()
  Future<String> createUser(
      @Field() String email,
      @Field() String username,
      @Field() String password,
      @Field() String first_name);

  @POST('api/jwt/create/')
  @FormUrlEncoded()
  Future<TokenResponseModel> createToken(
    @Field() String username,
    @Field() String password,
  );
}

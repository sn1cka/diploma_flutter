import 'package:flutter_app/api/tour_model.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'api_caller.g.dart';

@RestApi(baseUrl: 'https://127.0.0.1/')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/tours')
  Future<List<Tour>> getTours();
}


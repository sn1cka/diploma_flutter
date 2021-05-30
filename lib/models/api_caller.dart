import 'package:dio/dio.dart';
import 'package:flutter_app/api/company_model.dart';
import 'package:flutter_app/models/tour_model.dart';
import 'package:retrofit/http.dart';

part 'api_caller.g.dart';

@RestApi(baseUrl: 'http://192.168.0.100:8000/')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('api/tours/')
  Future<List<Tour>> getAllTours();

  @GET('api/tours/{id}/feeds/')
  Future<List<TourFeed>> getFeedsByTour(@Path() int id);
  //
  // @POST('api/users/')
  // Future<>
}

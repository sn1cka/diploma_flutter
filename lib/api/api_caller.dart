import 'package:dio/dio.dart';
import 'package:flutter_app/api/company_model.dart';
import 'package:flutter_app/api/tour_model.dart';
import 'package:retrofit/http.dart';

part 'api_caller.g.dart';

@RestApi(baseUrl: 'http://172.20.10.3:8000/')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('api/tours/')
  Future<List<Tour>> getAllTours();

  @GET('api/tours/{id}/feeds/')
  Future<List<TourFeed>> getFeedsByTour(@Path() int id);

}

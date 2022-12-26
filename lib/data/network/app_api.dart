import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_template/app/constant.dart';
import 'package:flutter_template/data/model/login/authentication_response.dart';
import 'package:retrofit/http.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: Constant.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST("/login")
  Future<AuthenticationResponse> login(
      @Field("username") String email, @Field("password") String password);

}

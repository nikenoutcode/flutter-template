import 'package:flutter_template/data/model/login/authentication_response.dart';
import 'package:flutter_template/data/model/login/login_request.dart';

import '../network/app_api.dart';


abstract class RemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);
}

class RemoteDataSourceImplementer implements RemoteDataSource {
  AppServiceClient _appServiceClient;


  RemoteDataSourceImplementer(this._appServiceClient);

  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async{
    return await _appServiceClient.login(loginRequest.email, loginRequest.password);
  }


}
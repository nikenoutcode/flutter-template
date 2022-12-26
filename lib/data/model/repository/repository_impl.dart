

import 'package:either_dart/either.dart';
import 'package:flutter_template/data/data_source/remote_data_source.dart';
import 'package:flutter_template/data/mapper/mapper.dart';
import 'package:flutter_template/data/model/common/Failure.dart';
import 'package:flutter_template/data/model/login/Authentication.dart';
import 'package:flutter_template/data/model/login/login_request.dart';
import 'package:flutter_template/data/network/error_handler.dart';
import 'package:flutter_template/data/network/network_info.dart';
import 'package:flutter_template/domain/repository/repository.dart';

class RepositoryImpl extends Repository {
  RemoteDataSource _remoteDataSource;
  NetworkInfo _networkInfo;

  RepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.login(loginRequest);
        if (response.code == ApiInternalStatus.SUCCESS) {
          //success
          return Right(response.toDomain());
        } else {
          return Left(Failure(response.code ?? ApiInternalStatus.FAILURE, ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return (Left(ErrorHandler.handle(error).failure));
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}

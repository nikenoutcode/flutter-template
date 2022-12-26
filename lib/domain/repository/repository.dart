import 'package:either_dart/either.dart';
import 'package:flutter_template/data/model/common/Failure.dart';
import 'package:flutter_template/data/model/login/Authentication.dart';
import 'package:flutter_template/data/model/login/login_request.dart';

abstract class Repository {
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);
}
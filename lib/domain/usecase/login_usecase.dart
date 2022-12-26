
import 'package:either_dart/either.dart';
import 'package:flutter_template/data/model/login/Authentication.dart';
import 'package:flutter_template/data/model/login/login_request.dart';
import 'package:flutter_template/domain/repository/repository.dart';

import '../../data/model/common/Failure.dart';
import 'base_usecase.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, Authentication> {
  Repository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, Authentication>> execute(
      LoginUseCaseInput input) async {
    return await _repository.login(LoginRequest(
        input.email, input.password));
  }
}

class LoginUseCaseInput {
  String email;
  String password;

  LoginUseCaseInput(this.email, this.password);
}

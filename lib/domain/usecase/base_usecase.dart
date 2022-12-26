
import 'package:either_dart/either.dart';
import 'package:flutter_template/data/model/common/Failure.dart';

abstract class BaseUseCase<In, Out> {
  Future<Either<Failure, Out>> execute(In input);
}

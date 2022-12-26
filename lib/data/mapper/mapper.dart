import 'package:flutter_template/data/model/login/Authentication.dart';
import 'package:flutter_template/data/model/login/authentication_response.dart';

const EMPTY = "";
const ZERO = 0;

extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(this?.data?.username ?? EMPTY, this?.data?.token ?? EMPTY);
  }
}
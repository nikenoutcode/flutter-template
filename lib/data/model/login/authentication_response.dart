import 'package:json_annotation/json_annotation.dart';
part 'authentication_response.g.dart';

@JsonSerializable()
class AuthenticationResponse {
  @JsonKey(name: "code")
  int? code;
  @JsonKey(name: "success")
  bool? success;
  @JsonKey(name: "data")
  Data? data;

  AuthenticationResponse(this.code, this.success, this.data);


  //from json
  factory AuthenticationResponse.fromJson(Map<String, dynamic> json) => _$AuthenticationResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$AuthenticationResponseToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "username")
  String? username;

  @JsonKey(name: "token")
  String? token;

  Data(this.username, this.token);

  //from json
  factory Data.fromJson(Map<String, dynamic> json) =>
      _$DataFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$DataToJson(this);
}

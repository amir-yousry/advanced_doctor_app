import 'package:json_annotation/json_annotation.dart';
part 'signup_responce.g.dart';

@JsonSerializable()
class SignupResponce {
  String? message;
  @JsonKey(name: 'data')
  UserData? userData;
  bool? status;
  int? code;

  SignupResponce({this.message, this.userData, this.status, this.code});

  factory SignupResponce.fromJson(Map<String, dynamic> json) =>
      _$SignupResponceFromJson(json);
}

@JsonSerializable()
class UserData {
  String? token;
  @JsonKey(name: 'username')
  String? userName;

  UserData({this.token, this.userName});

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}

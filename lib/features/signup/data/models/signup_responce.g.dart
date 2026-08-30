// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupResponce _$SignupResponceFromJson(Map<String, dynamic> json) =>
    SignupResponce(
      message: json['message'] as String?,
      userData: json['data'] == null
          ? null
          : UserData.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as bool?,
      code: (json['code'] as num?)?.toInt(),
    );

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
  token: json['token'] as String?,
  userName: json['username'] as String?,
);

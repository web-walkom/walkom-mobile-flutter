import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:walkom_mobile_flutter/core/constants.dart';
import 'package:walkom_mobile_flutter/repositories/auth/auth.dart';
import 'package:walkom_mobile_flutter/repositories/users/users.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required this.dio,
    required this.userBox,
  });

  final Dio dio;
  final Box<User> userBox;

  @override
  Future<ResultSendCode> sendCodeEmail(String email) async {
    Map<String, String> body = {
      FIELD_EMAIL: email,
    };

    final response = await dio.post(
      'https://api.walkom.ru/api/auth/send-code',
      data: body,
    );
    return ResultSendCode.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<ResultCheckCode> checkSecretCode(String email, int code) async {
    Map<String, dynamic> body = {
      FIELD_EMAIL: email,
      FIELD_SECRET_CODE: code,
    };

    final response = await dio.post(
      'https://api.walkom.ru/api/auth/check-code',
      data: body,
    );
    final resultCheckCode = ResultCheckCode.fromJson(response.data as Map<String, dynamic>);

    if (resultCheckCode.status) {
      await userBox.put(resultCheckCode.user.id, resultCheckCode.user);
      USER = resultCheckCode.user;
    }

    return resultCheckCode;
  }
}

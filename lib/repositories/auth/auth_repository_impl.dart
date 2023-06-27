import 'package:dio/dio.dart';
import 'package:walkom_mobile_flutter/repositories/auth/auth.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<ResultSendCode> sendCodeEmail(String email) async {
    Map<String, String> body = {
      'email': email,
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
      'email': email,
      'secret_code': code,
    };

    final response = await dio.post(
      'https://api.walkom.ru/api/auth/check-code',
      data: body,
    );
    return ResultCheckCode.fromJson(response.data as Map<String, dynamic>);
  }
}

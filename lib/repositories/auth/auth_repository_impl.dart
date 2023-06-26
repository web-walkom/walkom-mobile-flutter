import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:walkom_mobile_flutter/repositories/auth/auth.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<void> sendCodeEmail(String email) async {
    Map<String, String> body = {
      'email': email,
    };

    await Dio().post(
      'https://api.walkom.ru/api/auth/send-code',
      data: body,
    );
  }

  @override
  Future<bool> checkSecretCode(String email, int code) async {
    Map<String, dynamic> body = {
      'email': email,
      'secret_code': code,
    };

    final response = await Dio().post(
      'https://api.walkom.ru/api/auth/check-code',
      data: body,
    );
    log(response.data.toString());
    return true;
  }
}

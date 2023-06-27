import 'package:dio/dio.dart';
import 'package:walkom_mobile_flutter/repositories/users/users.dart';

class UsersRepositoryImpl implements UsersRepository {
  UsersRepositoryImpl({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<User> getUserById(String id) async {
    final response = await Dio().get('https://api.walkom.ru/api/user/$id');
    return User.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<ResultUpdateUser> updateUser(String id, String photo, String firstName, String lastName) async {
    Map<String, dynamic> body = {
      'photo': photo,
      'first_name': firstName,
      'last_name': lastName,
    };

    final token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2OTA0Mjk4NTAsInN1YiI6IjY0MTVhMTNmNGM2MWJjYTViNGMzOWZkMiJ9.NAe-iV1BJE3OcdbKTt1y41SqndRFA1PE0Xen5c2nCsM";

    dio.options.headers["Authorization"] = "Bearer $token";
    final response = await Dio().post(
      'https://api.walkom.ru/api/user/$id/update',
      data: body,
    );
    return ResultUpdateUser.fromJson(response.data as Map<String, dynamic>);
  }
}

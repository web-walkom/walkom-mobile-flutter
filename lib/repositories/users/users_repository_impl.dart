import 'package:dio/dio.dart';
import 'package:walkom_mobile_flutter/core/constants.dart';
import 'package:walkom_mobile_flutter/repositories/users/users.dart';

class UsersRepositoryImpl implements UsersRepository {
  UsersRepositoryImpl({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<User> getUserById(String id) async {
    final response = await dio.get('https://api.walkom.ru/api/user/$id');
    return User.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<ResultUpdateUser> updateUser(User user) async {
    Map<String, dynamic> body = {
      FIELD_PHOTO: user.photo,
      FIELD_FIRST_NAME: user.firstName,
      FIELD_LAST_NAME: user.lastName,
    };

    dio.options.headers["Authorization"] = "Bearer ${user.accessToken}";
    final response = await dio.post(
      'https://api.walkom.ru/api/user/${user.id}/update',
      data: body,
    );
    return ResultUpdateUser.fromJson(response.data as Map<String, dynamic>);
  }
}

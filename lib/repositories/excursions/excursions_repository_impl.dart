import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:walkom_mobile_flutter/repositories/excursions/excursions.dart';

class ExcursionsRepositoryImpl implements ExcursionsRepository {
  ExcursionsRepositoryImpl({
    required this.dio,
    required this.excursionsBox,
  });

  final Dio dio;
  final Box<Excursion> excursionsBox;

  @override
  Future<List<Excursion>> getExcursions() async {
    try {
      final response = await dio.get('https://api.walkom.ru/api/excursions');
      final excursionsList = (response.data as List<dynamic>)
          .map((e) => Excursion.fromJson(e))
          .toList();

      final excursionsMap = {for (var e in excursionsList) e.id: e};
      await excursionsBox.putAll(excursionsMap);

      return excursionsList;
    } catch (e, st) {
      GetIt.I<Talker>().handle(e, st);
      return excursionsBox.values.toList();
    }
  }

  @override
  Future<ExcursionDetail> getExcursionById(String id) async {
    final response =
        await dio.get('https://api.walkom.ru/api/excursions/$id');
    return ExcursionDetail.fromJson(response.data as Map<String, dynamic>);
  }
}

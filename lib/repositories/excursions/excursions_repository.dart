import 'package:dio/dio.dart';
import 'package:walkom_mobile_flutter/repositories/excursions/models/excursion.dart';

class ExcursionsRepository {
  Future<List<ExcursionItem>> getExcursions() async {
    final response = await Dio().get('http://api.walkom.ru/api/excursions');
    final data = response.data as List<dynamic>;

    final excursionsList = data
        .map((e) => ExcursionItem(
              id: e['id'],
              title: e['title'],
              photos: List<String>.from(e['photos']),
            ))
        .toList();
    return excursionsList;
  }
}

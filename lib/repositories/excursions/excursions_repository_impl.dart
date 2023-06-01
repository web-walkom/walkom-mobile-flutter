import 'package:dio/dio.dart';
import 'package:walkom_mobile_flutter/repositories/excursions/excursions.dart';

class ExcursionsRepositoryImpl implements ExcursionsRepository {
  ExcursionsRepositoryImpl({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<List<ExcursionItem>> getExcursions() async {
    final response = await Dio().get('https://api.walkom.ru/api/excursions');
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

  @override
  Future<ExcursionOpen> getExcursionById(String id) async {
    final response =
        await Dio().get('https://api.walkom.ru/api/excursions/$id');
    final data = response.data as Map<String, dynamic>;

    final excursion = ExcursionOpen(
      id: data['id'],
      title: data['title'],
      description: data['description'],
      photos: List<String>.from(data['photos']),
      // placemarks: data['placemarks'].map(
      //   (e) => Placemark(
      //     id: e['id'],
      //     title: e['title'],
      //     photos: List<String>.from(e['photos']),
      //     latitude: e['latitude'],
      //     longitude: e['longitude'],
      //   ),
      // ),
    );
    return excursion;
  }
}

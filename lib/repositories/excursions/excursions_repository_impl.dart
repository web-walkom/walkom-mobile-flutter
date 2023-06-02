import 'package:dio/dio.dart';
import 'package:walkom_mobile_flutter/repositories/excursions/excursions.dart';

class ExcursionsRepositoryImpl implements ExcursionsRepository {
  ExcursionsRepositoryImpl({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<List<Excursion>> getExcursions() async {
    final response = await Dio().get('https://api.walkom.ru/api/excursions');
    return (response.data as List<dynamic>)
        .map((e) => Excursion.fromJson(e))
        .toList();
  }

  @override
  Future<ExcursionDetail> getExcursionById(String id) async {
    final response =
        await Dio().get('https://api.walkom.ru/api/excursions/$id');
    return ExcursionDetail.fromJson(response.data as Map<String, dynamic>);

    // return ExcursionDetail(
    //   id: id,
    //   title: data['title'],
    //   photos: List<String>.from(data['photos']),
    //   description: data['description'],
    //   placemarks: data['placemarks'].map(
    //     (e) => Placemark(
    //       id: e['id'],
    //       title: e['title'],
    //       photos: List<String>.from(e['photos']),
    //       latitude: e['latitude'],
    //       longitude: e['longitude'],
    //     ),
    //   ),
    // );
  }
}

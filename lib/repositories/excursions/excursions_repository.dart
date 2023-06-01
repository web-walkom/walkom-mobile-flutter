import 'package:walkom_mobile_flutter/repositories/excursions/models/excursion.dart';

abstract class ExcursionsRepository {
  Future<List<ExcursionItem>> getExcursions();
  Future<ExcursionOpen> getExcursionById(String id);
}

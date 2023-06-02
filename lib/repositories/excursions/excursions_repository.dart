import 'package:walkom_mobile_flutter/repositories/excursions/models/models.dart';

abstract class ExcursionsRepository {
  Future<List<Excursion>> getExcursions();
  Future<ExcursionDetail> getExcursionById(String id);
}

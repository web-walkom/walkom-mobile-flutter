import 'package:walkom_mobile_flutter/features/excursion/excursion.dart';
import 'package:walkom_mobile_flutter/features/excursions_list/excursions_list.dart';

final routes = {
  '/': (context) => const ExcursionsListScreen(),
  '/excursion': (context) => const ExcursionScreen(),
};

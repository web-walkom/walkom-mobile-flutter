import 'package:flutter/material.dart';
import 'package:walkom_mobile_flutter/repositories/excursions/models/excursion.dart';

class ExcursionTile extends StatelessWidget {
  const ExcursionTile({
    super.key,
    required this.excursion,
  });

  final ExcursionItem excursion;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        excursion.photos[0],
        width: 65,
      ),
      title: Text(
        excursion.title,
        style: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 18,
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(
          '/excursion',
          arguments: excursion.id,
        );
      },
    );
  }
}

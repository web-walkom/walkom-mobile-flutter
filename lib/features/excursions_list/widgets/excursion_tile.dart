import 'package:flutter/material.dart';
import 'package:walkom_mobile_flutter/repositories/excursions/models/excursion.dart';

class ExcursionTile extends StatelessWidget {
  const ExcursionTile({
    super.key,
    required this.excursion,
  });

  final Excursion excursion;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(25);

    return Card(
      color: Colors.white,
      shadowColor: Colors.black,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        borderRadius: borderRadius,
        onTap: () {
          Navigator.of(context).pushNamed(
            '/excursion',
            arguments: excursion.id,
          );
        },
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Ink.image(
                  image: NetworkImage(excursion.photos[0]),
                  fit: BoxFit.cover,
                  height: 280,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                    left: 15.0,
                    right: 15.0,
                    bottom: 10.0,
                  ),
                  child: Text(
                    excursion.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

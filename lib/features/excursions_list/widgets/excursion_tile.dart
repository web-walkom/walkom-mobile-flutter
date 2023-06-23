import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:walkom_mobile_flutter/repositories/excursions/models/excursion.dart';
import 'package:walkom_mobile_flutter/router/router.dart';

class ExcursionTile extends StatelessWidget {
  const ExcursionTile({
    super.key,
    required this.excursion,
  });

  final Excursion excursion;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(20);

    return Card(
      color: Colors.white,
      shadowColor: Colors.black,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        borderRadius: borderRadius,
        onTap: () {
          AutoRouter.of(context).push(ExcursionRoute(excursion: excursion));
        },
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Ink.image(
                  image: NetworkImage(excursion.photos[0]),
                  fit: BoxFit.cover,
                  height: 210,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15.0,
                    horizontal: 20.0,
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

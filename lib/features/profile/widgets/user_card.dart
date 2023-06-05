import 'package:flutter/material.dart';
import 'package:walkom_mobile_flutter/styles/color.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
    required this.name,
    required this.email,
    this.photo,
  });

  final String name;
  final String email;
  final String? photo;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: background,
      margin: const EdgeInsets.all(0),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 7,
          horizontal: 12,
        ),
        child: Row(
          children: [
            (photo != null)
                ? CircleAvatar(
                    backgroundImage: NetworkImage(photo!),
                    backgroundColor: lightSilver,
                  )
                : CircleAvatar(
                    backgroundColor: lightSilver,
                    radius: 21,
                  ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 17.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  email,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: lightGray,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:smart_queue/configs/color.dart';

class ProfileCard extends StatelessWidget {
  final String? pictureUrl;
  final String displayName;
  const ProfileCard({
    super.key,
    required this.pictureUrl,
    required this.displayName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage:
                (pictureUrl ?? '').isNotEmpty
                    ? NetworkImage(pictureUrl!)
                    : null,
            child:
                (pictureUrl ?? '').isEmpty
                    ? const Icon(Icons.person, size: 30)
                    : null,
          ),
          const SizedBox(width: 18),
          Flexible(
            child: Text(
              displayName,
              style: TextStyle(
                fontSize: 18,
                color: ColorsConfig.mainTextColor,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../core/utils.dart';
import '../../../core/widgets/profile_image.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: Row(
        children: [
          const ProfileImage(height: 32),
          const SizedBox(width: 8),
          Text(
            '$firstName $lastName',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontFamily: 'SFB',
            ),
          ),
        ],
      ),
    );
  }
}

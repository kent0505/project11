import 'package:flutter/material.dart';

import 'buttons/arrow_back_button.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: Row(
        children: [
          const ArrowBackButton(),
          const Spacer(),
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 19,
              fontFamily: 'SFB',
            ),
          ),
          const Spacer(),
          const SizedBox(width: 48),
        ],
      ),
    );
  }
}

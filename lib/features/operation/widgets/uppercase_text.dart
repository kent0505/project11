import 'package:flutter/material.dart';

class UppercaseText extends StatelessWidget {
  const UppercaseText(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 16),
        Text(
          title,
          style: TextStyle(
            // color: const Color(0xffEBEBF5).withOpacity(0.6),
            color: Colors.grey[700],
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}

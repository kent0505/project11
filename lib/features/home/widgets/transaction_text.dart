import 'package:flutter/material.dart';

class TransactionText extends StatelessWidget {
  const TransactionText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text(
          'Transactions',
          style: TextStyle(
            color: Colors.black,
            fontSize: 19,
            fontFamily: 'SFB',
          ),
        ),
      ],
    );
  }
}

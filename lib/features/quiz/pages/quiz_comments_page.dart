import 'package:flutter/material.dart';
import 'package:project11/core/widgets/custom_appbar.dart';

import '../../../core/widgets/custom_scaffold.dart';

class QuizCommentsPage extends StatelessWidget {
  const QuizCommentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: Column(
        children: [
          CustomAppbar('2 Comment'),
        ],
      ),
    );
  }
}

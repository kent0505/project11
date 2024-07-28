import 'package:flutter/material.dart';
import 'package:project11/features/quiz/widgets/question_card.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';

class QuizQuestionsPage extends StatelessWidget {
  const QuizQuestionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: Column(
        children: [
          CustomAppbar('Quiz'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(height: 8),
                Text(
                  'Possible improvements or modifications',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 23,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'SFB',
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      '10 Questions',
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 15,
                        fontFamily: 'SFM',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                QuestionCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

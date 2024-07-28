import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(10),
      ),
      child: CupertinoButton(
        onPressed: () {
          context.push('/comments');
        },
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: const DecorationImage(
                      image: AssetImage('assets/user1.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  'By James H.',
                  style: TextStyle(
                    color: AppColors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'SF',
                  ),
                ),
                const Spacer(),
                const Text(
                  'May 13, 2024',
                  style: TextStyle(
                    color: AppColors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'SF',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'What problems or inconveniences are you experiencing when using the current version of the application?',
              style: TextStyle(
                color: AppColors.text,
                fontSize: 19,
                fontFamily: 'SF',
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Container(
                  height: 40,
                  width: 58,
                  decoration: BoxDecoration(
                    color: AppColors.grey3,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 8),
                      SvgPicture.asset('assets/messages.svg'),
                      const SizedBox(width: 8),
                      const Text(
                        '2',
                        style: TextStyle(
                          color: AppColors.yellow,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'SFM',
                        ),
                      ),
                    ],
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

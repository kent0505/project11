import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/news.dart';

class BreakingNewsCard extends StatelessWidget {
  const BreakingNewsCard({super.key, required this.news});

  final News news;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 250,
      margin: const EdgeInsets.only(bottom: 25),
      child: CupertinoButton(
        onPressed: () {
          context.push('/news', extra: news);
        },
        padding: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: news.image,
                height: 120,
                width: 250,
                fit: BoxFit.fill,
                errorWidget: (context, url, error) {
                  return Container();
                },
              ),
            ),
            const SizedBox(height: 8),
            Text(
              news.title,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: AppColors.black,
                fontSize: 15,
                fontFamily: 'SF',
              ),
            ),
            const Spacer(),
            Text(
              news.time,
              style: const TextStyle(
                color: AppColors.grey,
                fontSize: 11,
                fontFamily: 'SF',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/profile_image.dart';
import '../bloc/settings_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: 44),
          ProfileImage(height: 96),
          SizedBox(height: 16),
          _UserName(),
          SizedBox(height: 24),
          _ProfileTile(
            title: 'My Profile',
            asset: 'profile1',
          ),
          SizedBox(height: 16),
          _ProfileTile(
            title: 'Ask of Question',
            asset: 'profile2',
          ),
          SizedBox(height: 16),
          _ProfileTile2(
            title: 'Privacy Policy',
            title2: 'Terms of Use',
            asset: 'profile3',
            asset2: 'profile4',
          ),
          SizedBox(height: 16),
          _ProfileTile2(
            title: 'Share app',
            title2: 'Rate the app',
            asset: 'profile5',
            asset2: 'profile6',
          ),
          SizedBox(height: 16),
          _ProfileTile(
            title: 'About app',
            asset: 'profile7',
          ),
        ],
      ),
    );
  }
}

class _UserName extends StatelessWidget {
  const _UserName();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return Text(
          '$firstName $lastName',
          style: const TextStyle(
            color: AppColors.text,
            fontSize: 21,
            fontWeight: FontWeight.w600,
            fontFamily: 'SFB',
          ),
        );
      },
    );
  }
}

class _ProfileTile extends StatelessWidget {
  const _ProfileTile({
    required this.title,
    required this.asset,
  });

  final String title;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(10),
      ),
      child: CupertinoButton(
        onPressed: () {
          if (asset == 'profile1') {
            context.push('/profile');
          }
        },
        padding: EdgeInsets.zero,
        child: Row(
          children: [
            const SizedBox(width: 16),
            SvgPicture.asset('assets/$asset.svg'),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(
                color: AppColors.text,
                fontSize: 15,
                fontFamily: 'SF',
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.chevron_right_rounded,
              color: AppColors.grey,
            ),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}

class _ProfileTile2 extends StatelessWidget {
  const _ProfileTile2({
    required this.title,
    required this.title2,
    required this.asset,
    required this.asset2,
  });

  final String title;
  final String title2;
  final String asset;
  final String asset2;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          CupertinoButton(
            onPressed: () {},
            minSize: 48,
            padding: EdgeInsets.zero,
            child: Row(
              children: [
                const SizedBox(width: 16),
                SvgPicture.asset('assets/$asset.svg'),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.text,
                    fontSize: 15,
                    fontFamily: 'SF',
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.chevron_right_rounded,
                  color: AppColors.grey,
                ),
                const SizedBox(width: 16),
              ],
            ),
          ),
          Container(
            height: 0.5,
            margin: const EdgeInsets.only(left: 48),
            color: AppColors.border,
          ),
          CupertinoButton(
            onPressed: () {},
            minSize: 48,
            padding: EdgeInsets.zero,
            child: Row(
              children: [
                const SizedBox(width: 16),
                SvgPicture.asset('assets/$asset2.svg'),
                const SizedBox(width: 8),
                Text(
                  title2,
                  style: const TextStyle(
                    color: AppColors.text,
                    fontSize: 15,
                    fontFamily: 'SF',
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.chevron_right_rounded,
                  color: AppColors.grey,
                ),
                const SizedBox(width: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

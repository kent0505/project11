import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils.dart';
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
          _ProfilePhoto(),
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

class _ProfilePhoto extends StatelessWidget {
  const _ProfilePhoto();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        String path = imagePath;

        if (state is ProfileImagePickedState) path = state.path;

        return Center(
          child: Container(
            height: 96,
            width: 96,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(48),
            ),
            child: path.isNotEmpty
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(48),
                    child: Image.file(
                      File(path),
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return SvgPicture.asset('assets/profile_photo.svg');
                      },
                    ),
                  )
                : SvgPicture.asset('assets/profile_photo.svg'),
          ),
        );
      },
    );
  }
}

class _UserName extends StatelessWidget {
  const _UserName();

  @override
  Widget build(BuildContext context) {
    return Text(
      '$firstName $lastName',
      style: const TextStyle(
        color: Colors.black,
        fontSize: 21,
        fontWeight: FontWeight.w600,
        fontFamily: 'SFB',
      ),
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
        // color: const Color(0xff1C1C1E),
        color: const Color(0xffF2F2F7), // Light mode background color
        borderRadius: BorderRadius.circular(10),
      ),
      child: CupertinoButton(
        onPressed: () {
          if (asset == 'profile1') {
            context.push('/myprofile');
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
                // color: Colors.white,
                color: Colors.black,
                fontSize: 15,
                fontFamily: 'SF',
              ),
            ),
            const Spacer(),
            Icon(
              Icons.chevron_right_rounded,
              // color: const Color(0xffEBEBF5).withOpacity(0.6),
              color: const Color(0xff1C1C1E).withOpacity(0.6),
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
        // color: const Color(0xff1C1C1E),
        color: const Color(0xffF2F2F7), // Light mode background color
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
                    // color: Colors.white,
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'SF',
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.chevron_right_rounded,
                  // color: const Color(0xffEBEBF5).withOpacity(0.6),
                  color: const Color(0xff1C1C1E).withOpacity(0.6),
                ),
                const SizedBox(width: 16),
              ],
            ),
          ),
          Container(
            height: 0.5,
            margin: const EdgeInsets.only(left: 48),
            color: const Color(0xff1C1C1E).withOpacity(0.6),
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
                    // color: Colors.white,
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'SF',
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.chevron_right_rounded,
                  // color: const Color(0xffEBEBF5).withOpacity(0.6),
                  color: const Color(0xff1C1C1E).withOpacity(0.6),
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

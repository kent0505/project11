import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../bloc/settings_bloc.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  ImagePicker picker = ImagePicker();
  XFile image = XFile('');

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          const CustomAppbar(title: 'My Profile'),
          const SizedBox(height: 24),
          BlocBuilder<SettingsBloc, SettingsState>(
            builder: (context, state) {
              return Center(
                child: Container(
                  height: 96,
                  width: 96,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(48),
                  ),
                  child: imagePath.isNotEmpty
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(48),
                          child: Image.file(
                            File(imagePath),
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return SvgPicture.asset(
                                'assets/profile_photo.svg',
                              );
                            },
                          ),
                        )
                      : SvgPicture.asset('assets/profile_photo.svg'),
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          CupertinoButton(
            onPressed: () async {
              image = await pickImage();
              if (image.path.isNotEmpty) {
                await saveImage(image.path).then((value) {
                  context.read<SettingsBloc>().add(PickProfileImageEvent());
                });
              }
            },
            padding: EdgeInsets.zero,
            minSize: 20,
            child: const Text(
              'Set New Photo',
              style: TextStyle(
                color: AppColors.yellow,
                fontSize: 17,
                fontFamily: 'SFB',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

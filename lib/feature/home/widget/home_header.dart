import 'package:flutter/material.dart';
import 'package:taskati/core/funcaion/naviator.dart';
import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/core/uitls/color.dart';
import 'package:taskati/core/uitls/text_styal.dart';
import 'dart:io';

import 'package:taskati/feature/profile/profile_view.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'hello ${AppLocalStorage.GetCachedData(AppLocalStorage.KName)} ',
              style: getTitleTextStyal(context, Color: AppColors.colorPrimary),
            ),
            Text(
              'have a nice day',
              style: getBodyTextStyal(
                context,
              ),
            ),
          ],
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            push(context, const ProfileView());
          },
          child: CircleAvatar(
            radius: 30,
            backgroundImage:
                AppLocalStorage.GetCachedData(AppLocalStorage.KImage) != null
                    ? FileImage(File(
                        AppLocalStorage.GetCachedData(AppLocalStorage.KImage)!))
                    : const AssetImage('assets/images/user.png')
                        as ImageProvider,
          ),
        )
      ],
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/funcaion/naviator.dart';
import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/core/uitls/color.dart';
import 'package:taskati/core/uitls/text_styal.dart';
import 'package:taskati/core/widgets/custom_button.dart';
import 'package:taskati/feature/home/home_view.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  File image =
      File(AppLocalStorage.GetCachedData(AppLocalStorage.KImage) ?? "");
  String? name;
  bool isDarkMode = false;
  @override
  Widget build(BuildContext context) {
    isDarkMode =
        AppLocalStorage.GetCachedData(AppLocalStorage.KIsDarkmode) ?? false;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                AppLocalStorage.CachedData(
                    AppLocalStorage.KIsDarkmode, !isDarkMode);

                setState(() {});
              },
              icon: const Icon(Icons.dark_mode, color: AppColors.colorPrimary)),
        ],
        leading: BackButton(onPressed: () {
          pushAndRemoveUntil(context, const HomeView());
        }),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(alignment: Alignment.center, children: [
                CircleAvatar(
                  radius: 100,
                  backgroundImage:
                      AppLocalStorage.GetCachedData(AppLocalStorage.KImage) !=
                              null
                          ? FileImage(image)
                          : const AssetImage('assets/images/user.png')
                              as ImageProvider,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              padding: const EdgeInsets.all((20)),
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                color: AppColors.whiteColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Gap(20),
                                  CustomButton(
                                    width: double.infinity,
                                    text: 'Uplode from camera ',
                                    ontap: () {
                                      ImagePicker()
                                          .pickImage(source: ImageSource.camera)
                                          .then(
                                        (value) {
                                          if (value != null) {
                                            File selectedImage =
                                                File(value.path);
                                            setState(() {
                                              image = selectedImage;
                                            });
                                          }
                                        },
                                      );
                                    },
                                  ),
                                  const Gap(10),
                                  CustomButton(
                                    width: double.infinity,
                                    ontap: () {
                                      ImagePicker()
                                          .pickImage(
                                              source: ImageSource.gallery)
                                          .then((value) {
                                        if (value != null) {
                                          File selectedImage = File(value.path);
                                          setState(() {
                                            image = selectedImage;
                                          });
                                          AppLocalStorage.CachedData(
                                              AppLocalStorage.KImage,
                                              value.path);
                                        }
                                      });
                                    },
                                    text: 'Uplode image from gallery',
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                    child: Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: const Icon(Icons.camera_alt,
                            color: AppColors.colorPrimary)),
                  ),
                ),
              ]),
              const Gap(20),
              // ignore: prefer_const_constructors
              Divider(
                endIndent: 20,
                indent: 20,
                color: AppColors.colorPrimary,
              ),
              const Gap(5),
              Row(
                children: [
                  Text(
                    AppLocalStorage.GetCachedData(AppLocalStorage.KName) ??
                        name ??
                        'name',
                    style: getBodyTextStyal(context,
                        color: AppColors.colorPrimary),
                  ),
                  const Spacer(),
                  IconButton.outlined(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            useSafeArea: true,
                            useRootNavigator: true,
                            builder: (context) {
                              return Container(
                                padding: EdgeInsets.only(
                                  top: 20,
                                  left: 20,
                                  right: 20,
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom,
                                ),
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  color: AppColors.whiteColor,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Gap(20),
                                    TextFormField(
                                      decoration: const InputDecoration(
                                       
                                        border: OutlineInputBorder(),
                                       
                                      ),

                                      initialValue:
                                          AppLocalStorage.GetCachedData(
                                                  AppLocalStorage.KName) ??
                                              '',
                                      style: const TextStyle(
                                        color: AppColors.colorPrimary,
                                      ),
                                      onFieldSubmitted: (name) {
                                        AppLocalStorage.CachedData(
                                            AppLocalStorage.KName, name);
                                      },
                                    ),
                                    const Gap(10),
                                    CustomButton(
                                      width: double.infinity,
                                      text: 'Update name',
                                      ontap: () {
                                        setState(() {
                                          AppLocalStorage.GetCachedData(
                                              AppLocalStorage.KName);
                                        });
                                      },
                                    ),
                                    const Gap(20),
                                  ],
                                ),
                              );
                            });
                      },
                      icon: const Icon(Icons.edit,
                          color: AppColors.colorPrimary)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

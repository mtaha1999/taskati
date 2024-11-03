import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/funcaion/naviator.dart';
import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/core/uitls/color.dart';

import 'package:taskati/core/widgets/custom_button.dart';
import 'package:taskati/feature/home/home_view.dart';

class UploeView extends StatefulWidget {
  const UploeView({super.key});

  @override
  State<UploeView> createState() => _UploeViewState();
}

class _UploeViewState extends State<UploeView> {
  File? image;
  String name = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                if (name.isNotEmpty && image != null) {
                  AppLocalStorage.CachedData(AppLocalStorage.KName, name);
                  AppLocalStorage.CachedData(AppLocalStorage.KImage, image!.path);
                  AppLocalStorage.CachedData(AppLocalStorage.KIsloaded, 'true');
                  pushReplacement(context, const HomeView());
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    backgroundColor: AppColors.colorPrimary,
                    content: Text('Done'),
                  ));
                } else if (name.isEmpty && image != null) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    backgroundColor: AppColors.redColor,
                    content: Text('please Enter name'),
                  ));
                } else if (name.isNotEmpty && image == null) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    backgroundColor: AppColors.redColor,
                    content: Text('Please uplode image'),
                  ));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    backgroundColor: AppColors.redColor,
                    content: Text('Please upload image and name'),
                  ));
                }
              },
              child: const Text(
                'Done',
                style: TextStyle(color: AppColors.colorPrimary),
              ))
        ],
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 80,
                backgroundColor: AppColors.colorPrimary,
                backgroundImage: (image != null)
                    ? Image.file(image!).image
                    : const AssetImage('assets/images/user.png'),
              ),
              const Gap(20),
              CustomButton(
                ontap: () {
                  ImagePicker()
                      .pickImage(source: ImageSource.camera)
                      .then((value) {
                    if (value != null) {
                      File selectedImage = File(value.path);
                      setState(() {
                        image = selectedImage;
                      });
                    }
                  });
                },
                text: 'Uplode image from camera', 
              ),
              const Gap(10),
              CustomButton(
                ontap: () {
                  ImagePicker()
                      .pickImage(source: ImageSource.gallery)
                      .then((value) {
                    if (value != null) {
                      File selectedImage = File(value.path);
                      setState(() {
                        image = selectedImage;
                      });
                    }
                  });
                },
                text: 'Uplode image from gallery', 
              ),
              const Gap(15),
              const Divider(
                color: AppColors.greyColor,
                thickness: 1,
              ),
              const Gap(15),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
                decoration: const InputDecoration(
                  hintText: ('Enter name'),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

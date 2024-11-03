import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:taskati/core/model/task_modal.dart';
import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/core/uitls/color.dart';

import 'package:taskati/core/uitls/themes/theme.dart';
import 'package:taskati/feature/intro/splash.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModalAdapter());
  await Hive.openBox('userBox');
  await Hive.openBox<TaskModal>('taskBox');

  AppLocalStorage.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.colorPrimary,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return ValueListenableBuilder(
        valueListenable: AppLocalStorage.ueserBox.listenable(),
        builder: (context, box, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode:
                AppLocalStorage.GetCachedBoleanData(AppLocalStorage.KIsDarkmode)
                    ? ThemeMode.dark
                    : ThemeMode.light,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            home: const SpashViwe(),
          );
        });
  }
}

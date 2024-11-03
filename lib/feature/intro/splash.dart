import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/funcaion/naviator.dart';
import 'package:taskati/core/services/local_storage.dart';

import 'package:taskati/core/uitls/text_styal.dart';
import 'package:taskati/feature/home/home_view.dart';
import 'package:taskati/feature/uplode/uplode_view.dart';

class SpashViwe extends StatefulWidget {
  const SpashViwe({super.key});

  @override
  State<SpashViwe> createState() => _SpashViweState();
}

class _SpashViweState extends State<SpashViwe> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      if (AppLocalStorage.GetCachedData(AppLocalStorage.KIsloaded) == true) {
        pushAndRemoveUntil(
            // ignore: use_build_context_synchronously
            context,
            const HomeView());
      } else {
        pushAndRemoveUntil(
          // ignore: use_build_context_synchronously
          context,
          const UploeView(),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              child: SizedBox(
                height: 320,
                child: Lottie.asset(
                  'assets/images/tasks.json',
                ),
              ),
            ),
            Text(
              'Taskati',
              style: getTitleTextStyal(context,  fontsize: 24, ),
            ),
            const Gap(10),
            Text(
              'It is time to be organized',
              style: getSmallTextStyal(context,  fontsize: 14),
            )
            // Text('It is time to be organized',getsmalleTextStyal(),)
          ],
        ),
      ),
    );
  }
}

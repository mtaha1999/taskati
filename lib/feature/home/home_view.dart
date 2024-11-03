import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/feature/home/widget/home_header.dart';
import 'package:taskati/feature/home/widget/task_list_billduer.dart';
import 'package:taskati/feature/home/widget/today_header.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              HomeHeader(),
              Gap(20),
              TodayHeader(),
              Gap(20),
              Expanded(child: TaskListBillduer()),
            ],
          ),
        ),
      ),
    );
  }
}

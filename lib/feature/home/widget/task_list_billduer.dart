import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/model/task_modal.dart';
import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/core/uitls/color.dart';
import 'package:taskati/core/uitls/text_styal.dart';

import 'package:taskati/core/widgets/task_item.dart';

class TaskListBillduer extends StatefulWidget {
  const TaskListBillduer({
    super.key,
  });

  @override
  State<TaskListBillduer> createState() => _TaskListBillduerState();
}

class _TaskListBillduerState extends State<TaskListBillduer> {
  String selectedDate = DateFormat.yMd().format(DateTime.now());
  List<dynamic> tasksKeysList = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DatePicker(
          height: 100,
          width: 80,
          DateTime.now().subtract(const Duration(days: 2)),
          initialSelectedDate: DateTime.now(),
          selectionColor: AppColors.colorPrimary,
          selectedTextColor: AppColors.whiteColor,
          dateTextStyle: getBodyTextStyal(context),
          dayTextStyle: getBodyTextStyal(context),
          monthTextStyle: getBodyTextStyal(context),
          onDateChange: (date) {
            setState(() {
              selectedDate = DateFormat.yMd().format(date);
            });
          },
        ),
        const Gap(20),
        Expanded(
            child: ValueListenableBuilder(
                valueListenable: AppLocalStorage.taskBox.listenable(),
                builder: (context, box, child) {
                  List<TaskModal> tasklist = [];
                  tasksKeysList = [];
                  tasksKeysList.addAll(box.keys);
                  for (var key in box.keys) {
                    if (AppLocalStorage.taskBox.get(key)!.date ==
                        selectedDate) {
                      tasklist.add(AppLocalStorage.taskBox.get(key)!);
                    }
                  }

                  return tasklist.isEmpty
                      ? Column(children: [
                          Lottie.asset('assets/images/noTask.json'),
                          const Gap(20),
                          Text(
                            'No task for this day',
                            style: getBodyTextStyal(context, fontsize: 16),
                          )
                        ])
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: tasklist.length,
                          itemBuilder: (context, index) {
                            // Initial opacity is set to 0 and will animate to 1
                            double _opacity = 0.0;

                            // Introduce a delay to see the animation effect clearly
                            Future.delayed(Duration(milliseconds: 100 * index),
                                () {
                              setState(() {
                                _opacity = 1.0;
                              });
                            });

                            return AnimatedOpacity(
                              opacity: _opacity,
                              duration: const Duration(
                                  seconds: 1), // Duration of the fade effect
                              child: Dismissible(
                                onDismissed: (direction) async {
                                  // Handle dismiss actions here
                                },
                                secondaryBackground: Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: AppColors.redColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      const Icon(Icons.delete,
                                          color: AppColors.whiteColor),
                                      const Gap(5),
                                      Text(
                                        'Delete task',
                                        style: getBodyTextStyal(context,
                                            color: AppColors.whiteColor),
                                      ),
                                    ],
                                  ),
                                ),
                                background: Container(
                                    // Similar setup for the "complete task" background
                                    ),
                                key: UniqueKey(),
                                child: TaskItemWidget(modal: tasklist[index]),
                              ),
                            );
                          },
                        );
                })),
      ],
    );
  }
}

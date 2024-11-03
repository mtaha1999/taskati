import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/funcaion/naviator.dart';
import 'package:taskati/core/model/task_modal.dart';
import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/core/uitls/color.dart';
import 'package:taskati/core/uitls/text_styal.dart';
import 'package:taskati/core/widgets/custom_button.dart';
import 'package:taskati/feature/home/home_view.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({super.key, this.model });
  final TaskModal? model;

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  late int colorindex;
  late String date;
  late String starttime;
  late String endtime;
  var titelcontroller = TextEditingController();
  var notelcontroller = TextEditingController();
  @override
  initState() {
    super.initState();
    titelcontroller.text = widget.model?.title ?? '';
    notelcontroller.text = widget.model?.note ?? '';
    colorindex = widget.model?.color ?? 0;
    date = widget.model?.date ?? DateFormat.yMd().format(DateTime.now());
    starttime =
        widget.model?.starttime ?? DateFormat('h:mm a').format(DateTime.now());
    endtime =
        widget.model?.endtime ?? DateFormat('h:mm a').format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.model == null ? 'Add Task' : 'update Task',
              style: getBodyTextStyal(context, color: AppColors.colorPrimary)),
        ),
        body: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Task',
                  style: getBodyTextStyal(context),
                ),
                TextFormField(
                  controller: titelcontroller,
                  decoration: const InputDecoration(
                    hintText: "ex: flutter task ",
                  ),
                ),
                const Gap(10),
                Text(
                  'Note',
                  style: getBodyTextStyal(context),
                ),
                TextFormField(
                  controller: notelcontroller,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    hintText: "ex: flutter task Note .... ",
                  ),
                ),
                const Gap(10),
                Text(
                  'Date',
                  style: getBodyTextStyal(context),
                ),
                TextFormField(
                  readOnly: true,
                  onTap: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2040),
                    ).then((value) {
                      if (value != null) {
                        setState(() {
                          date = DateFormat.yMd().format(value);
                        });
                      }
                    });
                  },
                  decoration: InputDecoration(
                    suffixIcon: const Icon(
                      Icons.calendar_month_rounded,
                      color: AppColors.colorPrimary,
                    ),
                    hintText: date,
                  ),
                ),
                const Gap(10),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      'Start time',
                      style: getBodyTextStyal(context),
                    )),
                    const Gap(10),
                    Expanded(
                        child: Text(
                      'End time',
                      style: getBodyTextStyal(context),
                    )),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                      readOnly: true,
                      onTap: () {
                        showTimePicker(
                                context: context, initialTime: TimeOfDay.now())
                            .then((value) {
                          if (value != null) {
                            setState(() {
                              endtime = value.format(context);
                            });
                          }
                        });
                      },
                      decoration: InputDecoration(
                        suffixIcon: const Icon(
                          Icons.watch_later_outlined,
                          color: AppColors.colorPrimary,
                        ),
                        hintText: endtime,
                      ),
                    )),
                    const Gap(10),
                    Expanded(
                        child: TextFormField(
                            readOnly: true,
                            onTap: () {
                              showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now())
                                  .then((value) {
                                if (value != null) {
                                  setState(() {
                                    starttime = value.format(context);
                                  });
                                }
                              });
                            },
                            decoration: InputDecoration(
                              suffixIcon: const Icon(
                                Icons.watch_later_outlined,
                                color: AppColors.colorPrimary,
                              ),
                              hintText: starttime,
                            ))),
                  ],
                ),
                const Gap(30),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                          children: List.generate(3, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                colorindex = index;
                              });
                            },
                            child: CircleAvatar(
                                radius: 24,
                                backgroundColor: (index == 0)
                                    ? AppColors.colorPrimary
                                    : (index == 1)
                                        ? AppColors.orangeColor
                                        : AppColors.redColor,
                                child: (colorindex == index)
                                    ? const Icon(Icons.check,
                                        color: AppColors.whiteColor)
                                    : null),
                          ),
                        );
                      })),
                    ),
                    CustomButton(
                      text:
                          widget.model == null ? 'cerate task' : 'update task',
                      ontap: () {
                        String id = widget.model?.id ??
                            '$Title-${DateTime.now().toString()}';
                        AppLocalStorage.Cachedtask(
                            id,
                            TaskModal(
                                title: titelcontroller.text,
                                note: notelcontroller.text,
                                date: date,
                                starttime: starttime,
                                endtime: endtime,
                                isCompleted: false,
                                color: colorindex,
                                id: id));
                        pushAndRemoveUntil(context, const HomeView());
                      },
                      width: 150, 
                    ),
                  ],
                )
              ],
            )));
  }
}

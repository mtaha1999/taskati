import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/funcaion/naviator.dart';

import 'package:taskati/core/uitls/color.dart';
import 'package:taskati/core/uitls/text_styal.dart';

import 'package:taskati/core/widgets/custom_button.dart';
import 'package:taskati/feature/AddTask/add_task_view.dart';

class TodayHeader extends StatelessWidget {
  const TodayHeader({
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
              DateFormat.yMMMMd().format(DateTime.now()),
              style: getTitleTextStyal(context, ),
            ),
            Text(
              ' Today',
              style: getTitleTextStyal(context),
            ),
          ],
        ),
        const Spacer(),
        CustomButton(
          text: '+ Add Task',
          ontap: () {
            push(context, const AddTaskView());
          },
          width: 130,
          height: 40, 
        )
      ],
    );
  }
}

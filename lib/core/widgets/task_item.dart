import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/funcaion/naviator.dart';
import 'package:taskati/core/model/task_modal.dart';
import 'package:taskati/core/uitls/color.dart';
import 'package:taskati/core/uitls/text_styal.dart';
import 'package:taskati/feature/AddTask/add_task_view.dart';

class TaskItemWidget extends StatelessWidget {
  const TaskItemWidget({
    super.key,
    required this.modal,
  });
  final TaskModal? modal;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (modal?.isCompleted != true) {
          push(context, AddTaskView(model: modal));
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10, right: 5, left: 5),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: (modal?.color == 0)
              ? AppColors.colorPrimary
              : (modal?.color == 1)
                  ? AppColors.orangeColor
                  : AppColors.redColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    modal?.title ?? '',
                    style: getTitleTextStyal(
                      context,
                    ),
                  ),
                  const Gap(5),
                  Row(
                    children: [
                      const Icon(
                        Icons.watch_later_outlined,
                        color: AppColors.whiteColor,
                      ),
                      Text(
                        '${modal?.starttime ?? ''} : ${modal?.endtime ?? ''}',
                        style: getSmallTextStyal(
                          context,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ],
                  ),
                  const Gap(5),
                  Text(
                    modal?.note ?? '',
                    style:
                        getBodyTextStyal(context, color: AppColors.whiteColor),
                  ),
                ],
              ),
            ),
            Container(
              width: 3,
              height: 60,
              color: AppColors.whiteColor,
            ),
            const Gap(10),
            RotatedBox(
                quarterTurns: 3,
                child: Text(
                  (modal?.isCompleted ?? false) ? 'Completed' : ' To Do',
                  style: getSmallTextStyal(
                    context,
                    color: AppColors.whiteColor,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

import 'package:hive/hive.dart';
  part 'task_modal.g.dart';
@HiveType(typeId: 1)
class TaskModal {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String note;

  @HiveField(2)
  final String date;

  @HiveField(3)
  final String starttime;

  @HiveField(4)
  final String endtime;
  @HiveField(5)
  final bool isCompleted;

  @HiveField(6)
  final int color;

  @HiveField(7)
  final String id;

  TaskModal(
      {required this.title,
      required this.note,
      required this.date,
      required this.starttime,
      required this.endtime,
      required this.isCompleted,
      required this.color,
      required this.id});
}

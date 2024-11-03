import 'package:hive/hive.dart';
import 'package:taskati/core/model/task_modal.dart';

class AppLocalStorage {
  static String KIsloaded = 'isupload';
  static String KIsDarkmode = 'isDarkmode';
  static String KName = 'name';
  static String KImage = 'image';

  static late Box ueserBox;
  static late Box<TaskModal> taskBox;

  static init() async {
    ueserBox = await Hive.openBox('userBox');
    taskBox = await Hive.openBox<TaskModal>('taskBox');
  }

  static CachedData(String key, value) {
    ueserBox.put(key, value);
  }

  static GetCachedData(String key) {
    return ueserBox.get(key);
  }
  static bool GetCachedBoleanData(String key) {
    bool data = ueserBox.get(key) ?? false; // get data
    return data;
  }
  

  static Cachedtask(String key, TaskModal value) {
    taskBox.put(key, value);
  }

  static TaskModal? GetCachedtask(String key) {
    return taskBox.get(key);
  }
}

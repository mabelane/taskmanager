import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../model/task.dart';
import '../data/db.dart';

class AddTaskController extends GetxController {
  var selectedTime = TimeOfDay.now().obs;
  var endTime = TimeOfDay.now().obs;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  int selectedRemind = 5;
  List<int> remindList = [5, 10, 15, 20];
  var taskList = <Task>[].obs;
  RxBool isTapped = false.obs;
  var selectedDate = DateTime.now().obs;

  Future<int> addTask({Task? tasks}) async {
    return await DBHelper.insert(tasks);
  }

  formattedStartTime() {
    return "${selectedTime.value.hour}:${selectedTime.value.minute}";
  }

  formattedEndTime() {
    return "${endTime.value.hour}:${endTime.value.minute}";
  }

  void getAllTask() async {
    List<Map<String, dynamic>> allTasks = await DBHelper.query();
    return taskList
        .assignAll(allTasks.map((data) => Task.fromJson(data)).toList());
  }

  void deleteTask(Task task) {
    DBHelper.deleteTask(task);
  }

  void displayOptions(int id) async {
    await DBHelper.showOptions(id);
  }

  void closeDisplayOptions(int id) async {
    await DBHelper.closeShowOptions(id);
  }

  chooseStartTime() async {
    TimeOfDay? startTimePicked = await showTimePicker(
        context: Get.context!,
        initialTime: TimeOfDay(
            hour: selectedTime.value.hour, minute: selectedTime.value.minute),
        builder: (BuildContext context, Widget? child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: child!,
          );
        },
        initialEntryMode: TimePickerEntryMode.dial);
    if (startTimePicked != null && startTimePicked != selectedTime.value) {
      selectedTime.value = startTimePicked;
      // endTime.value = timePicked;
    }
  }

  chooseEndTime() async {
    TimeOfDay? endTimePicked = await showTimePicker(
        context: Get.context!,
        initialTime:
            TimeOfDay(hour: endTime.value.hour, minute: endTime.value.minute),
        builder: (BuildContext context, Widget? child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: child!,
          );
        },
        initialEntryMode: TimePickerEntryMode.dial);
    if (endTimePicked != null && endTimePicked != endTime.value) {
      endTime.value = endTimePicked;
    }
  }
}

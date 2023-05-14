import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../util/controller/addtask_controller.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'tasklist.dart';
import 'topbar.dart';

class TasksUI extends StatelessWidget {
  TasksUI({super.key});
  final AddTaskController _controllerView = Get.put(AddTaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
        color: Colors.white,
        child: Column(
          children: [
            TopBar(),
            Container(
              margin: const EdgeInsets.only(bottom: 20, top: 0),
              child: DatePicker(
                DateTime.now(),
                height: 90,
              ),
            ),
            Obx(() {
              _controllerView.getAllTask();
              return Expanded(
                  child: ListView.builder(
                      itemCount: _controllerView.taskList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            _controllerView
                                .deleteTask(_controllerView.taskList[index]);
                            //_controllerView.getAllTask();
                          },
                          child:
                              TaskList(task: _controllerView.taskList[index]),
                        );
                      }));
            })
          ],
        ),
      )),
    );
  }
}

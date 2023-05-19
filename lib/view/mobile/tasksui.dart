import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../util/colours.dart';
import '../../util/controller/addtask_controller.dart';
import 'add.dart';
import 'tasklist.dart';
import 'topbar.dart';

class TasksUI extends StatelessWidget {
  TasksUI({super.key});
  final AddTaskController _controllerView = Get.put(AddTaskController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 50,
        shadowColor: Colors.transparent,
        title: const Text(
          "Tasks",
          textAlign: TextAlign.center,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    CupertinoPageRoute<Widget>(builder: (BuildContext context) {
                  return const AddT();
                }));
              },
              icon: const Icon(Icons.add))
        ],
        flexibleSpace: Container(
            decoration: BoxDecoration(
          gradient: LinearGradient(colors: [gradBColour, gradPColour]),
        )),
      ),
      body: Column(
        children: [
          TopBar(),
          Obx(() {
            _controllerView.getAllTask();
            return GestureDetector(
              onTap: () {
                // _controllerView.taskList.add(item)
              },
              child: Expanded(
                  child: ListView.builder(
                      itemCount: _controllerView.taskList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            if (_controllerView.taskList[index].tapped == 0) {
                              _controllerView.displayOptions(
                                  _controllerView.taskList[index].id!);
                            } else {
                              _controllerView.closeDisplayOptions(
                                  _controllerView.taskList[index].id!);
                            }
                          },
                          child: TaskList(
                            task: _controllerView.taskList[index],
                          ),
                        );
                      })),
            );
          })
        ],
      ),
    );
  }
}

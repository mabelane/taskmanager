import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../util/controller/addtask_controller.dart';
import 'add_task.dart';

class TopBar extends StatelessWidget {
  TopBar({super.key});
  final AddTaskController _controllerView = AddTaskController();
  @override
  Widget build(BuildContext context) {
    final String today = DateFormat("d MMMM").format(DateTime.now());
    return SizedBox(
      height: 75,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(today,
                  style: const TextStyle(color: Colors.grey, fontSize: 16)),
              const Text(
                "Today",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )
            ],
          ),
          SizedBox(
            width: 130,
            height: 45,
            child: ElevatedButton(
                onPressed: () async {
                  await Get.to(() => const AddTask());
                  _controllerView.getAllTask();
                },
                child: const Text("+ Add Task")),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../model/task.dart';
import '../../util/colours.dart';
import '../../util/controller/addtask_controller.dart';

class TaskList extends StatelessWidget {
  final Task? task;
  TaskList({super.key, this.task});
  final AddTaskController _controllerView = Get.put(AddTaskController());
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      height: 120,
      child: Row(
        children: [
          task?.tapped == 1
              ? SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 45,
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.info_outlined,
                              size: 30,
                            )),
                      ),
                      SizedBox(
                        width: 45,
                        child: IconButton(
                            onPressed: () {
                              _controllerView.deleteTask(task!);
                            },
                            icon: const Icon(
                              color: Colors.red,
                              Icons.delete,
                              size: 30,
                            )),
                      )
                    ],
                  ),
                )
              : SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 45,
                        child: Text(
                          task?.startTime ?? "",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(width: 45, child: Text(task?.endTime ?? "")),
                    ],
                  ),
                ),
          const SizedBox(
            width: 8,
          ),
          const Column(
            children: [
              CircleAvatar(
                minRadius: 8,
                backgroundColor: Color(0xFF7F86FF),
                child: CircleAvatar(
                  minRadius: 6,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    backgroundColor: Color(0xFF7F86FF),
                    minRadius: 4,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Expanded(
                child: VerticalDivider(
                  width: 10,
                  thickness: 2,
                  color: Color(0xBF7F86FF),
                ),
              )
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              //margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: _getBGColour(task?.colour ?? 0),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        task?.title ?? "",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      task?.flag == 1
                          ? const Icon(
                              Icons.flag,
                              color: Color.fromARGB(255, 185, 34, 24),
                            )
                          : const Text(
                              ":",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                    ],
                  ),
                  // const SizedBox(height: 5),
                  Text(
                    task?.note ?? "",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  // const SizedBox(height: 5),
                  Text("${task?.date}"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _getBGColour(int num) {
    switch (num) {
      case 0:
        return bgGColour;
      case 1:
        return rColour;
      case 2:
        return yColour;
      case 3:
        return pColour;
      default:
        return bgGColour;
    }
  }
}

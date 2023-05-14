import 'package:flutter/material.dart';

import '../../model/task.dart';
import '../../util/colours.dart';

class TaskList extends StatelessWidget {
  final Task? task;
  const TaskList({super.key, this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
      height: 140,
      child: Row(
        children: [
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 50,
                  child: Text(
                    task?.startTime ?? "",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(width: 50, child: Text(task?.endTime ?? "")),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
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
                  width: 18,
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
              margin: const EdgeInsets.only(bottom: 10),
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
                      const Text(
                        ":",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),
                  Text(task?.note ?? ""),
                  const SizedBox(height: 7),
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

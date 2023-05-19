import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskmanager/util/colours.dart';
import '../../util/controller/addtask_controller.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

class TopBar extends StatelessWidget {
  TopBar({super.key});
  final AddTaskController _controller = AddTaskController();
  final String today = DateFormat("d MMMM").format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [gradBColour, gradPColour]),
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      child: Column(
        children: [
          // const SizedBox(
          //   height: 8,
          // ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Today",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold)),
              Text(today,
                  style: const TextStyle(color: Colors.white, fontSize: 20)),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20, top: 0),
            child: DatePicker(
              DateTime.now(),
              height: 90,
              onDateChange: (date) {
                _controller.selectedDate.value = date;
              },
            ),
          ),
        ],
      ),
    );
  }
}

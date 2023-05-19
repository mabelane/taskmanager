import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../model/task.dart';
import '../../util/colours.dart';
import '../../util/controller/addtask_controller.dart';
import 'input.dart';

class AddT extends StatefulWidget {
  const AddT({super.key});

  @override
  State<AddT> createState() => _AddTState();
}

class _AddTState extends State<AddT> {
  DateTime? _setDate;
  var tomorow = DateTime.now().add(const Duration(days: 1));
  final AddTaskController _controller = AddTaskController();
  int _selectedColour = 0;
  bool _flag = false;
  bool isExpanded = false;
  bool showCalendar = false;
  String selectedPriority = "None";
  List<String> priorityList = [
    "None",
    "Low",
    "Medium",
    "High",
  ];
  var deco = BoxDecoration(
      color: Colors.white, borderRadius: BorderRadius.circular(10));

  formatDate(DateTime date) {
    if (_formatDateForDB(date) == _formatDateForDB(DateTime.now())) {
      return "Today";
    } else if (_formatDateForDB(date) == _formatDateForDB(tomorow)) {
      return "Tomorrow";
    } else {
      return DateFormat("EEEE dd MMMM yyyy").format(date);
    }
  }

  _formatDateForDB(DateTime date) {
    return DateFormat("dd/MM/yyyy").format(date);
  }

  _getTime({required isStartTime}) async {
    if (isStartTime == true) {
      _controller.chooseStartTime();
      setState(() {
        _controller.formattedStartTime();
      });
    } else if (isStartTime == false) {
      _controller.chooseEndTime();
      setState(() {
        _controller.formattedEndTime();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
          middle: Text('CupertinoPageScaffold Sample')),
      child: Material(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: deco,
              child: Column(children: [
                UserInput(
                  title: "Title",
                  placeholder: "Enter title here",
                  editingController: _controller.titleController,
                ),
                UserInput(
                  title: "Note",
                  placeholder: "Write note",
                  editingController: _controller.noteController,
                ),
                const SizedBox(
                  height: 10,
                )
              ]),
            ),
            Container(
              margin: const EdgeInsets.all(0),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  ExpansionTile(
                    initiallyExpanded: isExpanded,
                    tilePadding: EdgeInsets.zero,
                    childrenPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.calendar_month_rounded),
                    title: const Text("Date"),
                    subtitle: (_setDate != null)
                        ? Text("${formatDate(_setDate!)}")
                        : null,
                    expandedCrossAxisAlignment: CrossAxisAlignment.start,
                    // trailing: CupertinoSwitch(
                    //     value: showCalendar,
                    //     onChanged: (value) {
                    //       if (showCalendar != value && isExpanded != value) {
                    //         setState(() {
                    //           showCalendar = value;
                    //           isExpanded = value;
                    //         });
                    //       } else if (showCalendar != value &&
                    //           isExpanded == value) {
                    //         setState(() {
                    //           showCalendar = value;
                    //           isExpanded = value;
                    //         });
                    //       }
                    //     }),
                    onExpansionChanged: (value) {
                      if (isExpanded != value && showCalendar != value) {
                        setState(() {
                          showCalendar = value;
                          isExpanded = value;
                        });
                      } else {
                        setState(() {
                          showCalendar = showCalendar;
                          isExpanded = isExpanded;
                        });
                      }
                    },
                    children: [
                      SizedBox(
                        height: 250,
                        child: CalendarDatePicker(
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2121),
                          onDateChanged: (value) {
                            setState(() {
                              _setDate = value;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              decoration: deco,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: UserInput(
                        title: "StartTime",
                        placeholder: _controller.formattedStartTime(),
                        widget: IconButton(
                          icon: const Icon(Icons.access_time_rounded),
                          onPressed: () {
                            _getTime(isStartTime: true);
                          },
                        ),
                      )),
                      const SizedBox(width: 15),
                      Expanded(
                          child: UserInput(
                        title: "EndTime",
                        placeholder: _controller.formattedEndTime(),
                        widget: IconButton(
                          icon: const Icon(Icons.access_time_rounded),
                          onPressed: () {
                            _getTime(isStartTime: false);
                          },
                        ),
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 0),
              decoration: deco,
              child: ListTile(
                minLeadingWidth: 35,
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                horizontalTitleGap: 0,
                title: const Text("Flag"),
                leading: const Icon(Icons.flag_rounded),
                trailing: CupertinoSwitch(
                  value: _flag,
                  onChanged: (value) {
                    if (_flag != value) {
                      setState(() {
                        _flag = value;
                      });
                    } else {
                      setState(() {
                        _flag = _flag;
                      });
                    }
                  },
                ),
              ),
            ),
            UserInput(
                placeholder: selectedPriority,
                title: "Priority",
                widget: DropdownButton(
                    elevation: 4,
                    iconSize: 30,
                    underline: const SizedBox(
                      height: 0,
                    ),
                    icon: const Icon(Icons.keyboard_arrow_down),
                    onChanged: (newValue) {
                      setState(() {
                        selectedPriority = newValue!;
                      });
                    },
                    items: priorityList
                        .map<DropdownMenuItem<String>>((String? value) {
                      return DropdownMenuItem<String>(
                          value: value, child: Text(value!));
                    }).toList())),
            UserInput(
              placeholder: "${_controller.selectedRemind} minutes early",
              title: "Remind",
              widget: DropdownButton(
                  elevation: 4,
                  iconSize: 30,
                  underline: const SizedBox(
                    height: 0,
                  ),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  onChanged: (newValue) {
                    setState(() {
                      _controller.selectedRemind = int.parse(newValue!);
                    });
                  },
                  items: _controller.remindList
                      .map<DropdownMenuItem<String>>((int? value) {
                    return DropdownMenuItem<String>(
                        value: value.toString(),
                        child: Text(value!.toString()));
                  }).toList()),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                choosenColor(),
                SizedBox(
                  width: 130,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () => validateInputs(),
                      child: const Text("Submit")),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }

  validateInputs() {
    if (_controller.titleController.text.isNotEmpty &&
            _controller.noteController.text.isNotEmpty &&
            _controller.formattedStartTime() !=
                _controller.formattedEndTime() //&&
        // _controller.formattedEndTime() > _controller.formattedStartTime()
        ) {
      _submitTaskToDb();
      Get.back();
    } else if (_controller.titleController.text.isEmpty ||
        _controller.noteController.text.isEmpty) {
      Get.snackbar("Required", "All fields are required",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: const Color(0x997F86FF),
          maxWidth: 200,
          borderRadius: 15);
    }
  }

  _submitTaskToDb() async {
    await _controller.addTask(
        tasks: Task(
            note: _controller.noteController.text,
            title: _controller.titleController.text,
            date: (_setDate != null)
                ? _formatDateForDB(_setDate!)
                : _formatDateForDB(DateTime.now()),
            startTime: _controller.formattedStartTime(),
            endTime: _controller.formattedEndTime(),
            flag: _flag == false ? 0 : 1,
            priority: selectedPriority,
            remind: _controller.selectedRemind,
            colour: _selectedColour,
            done: 0,
            tapped: 0));
  }

  choosenColor() {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Colour",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Wrap(
              spacing: 8,
              children: List<Widget>.generate(4, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedColour = index;
                    });
                  },
                  child: CircleAvatar(
                    radius: 14,
                    backgroundColor: index == 0
                        ? gColour
                        : index == 1
                            ? rColour
                            : index == 2
                                ? yColour
                                : pColour,
                    child: _selectedColour == index
                        ? const Icon(
                            Icons.done,
                            size: 18,
                            color: Colors.white,
                          )
                        : const SizedBox(),
                  ),
                );
              }))
        ],
      ),
    );
  }
}

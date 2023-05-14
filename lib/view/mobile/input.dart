import 'package:flutter/material.dart';

class UserInput extends StatelessWidget {
  UserInput(
      {super.key,
      required this.placeholder,
      required this.title,
      this.editingController,
      this.widget});
  final String title;
  final TextEditingController? editingController;
  final String placeholder;
  final Widget? widget;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Container(
            margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.only(left: 10),
            height: 45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    width: 2, color: const Color.fromARGB(255, 184, 184, 184))),
            child: Row(
              children: [
                Flexible(
                  child: TextFormField(
                    readOnly: widget == null ? false : true,
                    controller: editingController,
                    decoration: InputDecoration(
                        hintText: placeholder,
                        focusedBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(width: 0, color: Colors.white)),
                        enabledBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(width: 0, color: Colors.white))),
                  ),
                ),
                widget == null ? const SizedBox() : SizedBox(child: widget)
              ],
            ),
          )
        ],
      ),
    );
  }
}

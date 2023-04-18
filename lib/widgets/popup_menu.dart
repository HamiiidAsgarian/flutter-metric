import 'package:flutter/material.dart';
import 'package:web_metric/Models/task_model.dart';

class CustomPopup extends StatelessWidget {
  const CustomPopup({super.key, required this.onSelected});
  final Function(String selected) onSelected;

  @override
  Widget build(BuildContext context) {
    String selected = TaskStatus.both.name;
    return Container(
      decoration: BoxDecoration(border: Border.all(), shape: BoxShape.circle),
      child: PopupMenuButton(
        // padding: EdgeInsets.symmetric(horizontal: 5),
        icon: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            // Text(selected, style: Consts.smallTextStyle),
            Icon(Icons.filter_alt_outlined)
          ],
        ),
        initialValue: selected,
        onSelected: (value) => onSelected(value),
        itemBuilder: (BuildContext context) {
          return [
            PopupMenuItem(
              value: TaskStatus.both.name,
              child: const Text("No Filter"),
            ),
            PopupMenuItem(
              value: TaskStatus.completed.name,
              child: const Text("Completed"),
            ),
            PopupMenuItem(
              value: TaskStatus.onProgress.name,
              child: const Text("OnProgress"),
            ),
          ];
        },
      ),
    );
  }
}

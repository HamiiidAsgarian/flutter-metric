import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:web_metric/Models/task_model.dart';
import 'package:web_metric/const.dart';

class TaskCard extends StatelessWidget {
  final Task data;
  final Function()? onTap;
  final Function()? onTapStatus;

  const TaskCard(
      {super.key, required this.data, required this.onTap, this.onTapStatus});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), color: Colors.amber),
        // height: 100,
        width: double.infinity,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(data.title, style: Consts.cardTextStyle),
          RawMaterialButton(
            constraints: const BoxConstraints(minWidth: 10, minHeight: 10),
            onPressed: onTapStatus,
            elevation: 2.0,
            fillColor: data.status == TaskStatus.completed
                ? Colors.green
                : const Color.fromARGB(255, 230, 230, 230),
            padding: const EdgeInsets.all(15.0),
            shape: const CircleBorder(),
            child: data.status == TaskStatus.onProgress
                ? const Icon(Icons.access_time)
                : const Icon(Icons.check),
          ),
        ]),
      ),
    );
  }
}

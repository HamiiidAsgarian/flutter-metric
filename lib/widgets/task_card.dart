import 'package:flutter/material.dart';
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
    return Material(
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        onTap: onTap,
        child: Ink(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Consts.mainPurple),
          // height: 100,
          width: double.infinity,
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(data.title,
                    style: Consts.cardTextStyle.copyWith(color: Colors.white)),
                RawMaterialButton(
                    constraints:
                        const BoxConstraints(minWidth: 10, minHeight: 10),
                    onPressed: onTapStatus,
                    elevation: 2.0,
                    fillColor: data.status == TaskStatus.completed
                        ? Colors.green
                        : const Color.fromARGB(255, 230, 230, 230),
                    padding: const EdgeInsets.all(15.0),
                    shape: const CircleBorder(),
                    child: data.status == TaskStatus.onProgress
                        //NOTE text has not been used, might be deleted later on
                        ? const StatusButton(
                            icon: (Icons.access_time), text: "On\nProgress")
                        : const StatusButton(
                            icon: (Icons.check), text: "Done")),
              ]),
        ),
      ),
    );
  }
}

class StatusButton extends StatelessWidget {
  const StatusButton({
    super.key,
    required this.text,
    required this.icon,
  });
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 25,
      height: 25,
      child: Icon(icon, size: 25),
    );
  }
}

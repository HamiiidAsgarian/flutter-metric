import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:web_metric/const.dart';

class TaskCard extends StatelessWidget {
  final String data;
  const TaskCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25), color: Colors.amber),
      // height: 100,
      width: double.infinity,
      child: Center(child: Text(data, style: Consts.cardTextStyle)),
    );
  }
}

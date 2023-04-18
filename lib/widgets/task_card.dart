import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

class TaskCard extends StatelessWidget {
  final String data;
  const TaskCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      color: Colors.amber,
      child: Center(child: Text(data)),
    );
  }
}

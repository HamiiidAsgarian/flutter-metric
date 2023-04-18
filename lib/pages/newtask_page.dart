import 'package:flutter/material.dart';
import 'package:web_metric/const.dart';
import 'package:web_metric/widgets/custom_appbar.dart';

import '../widgets/custome_textinput.dart';

class NewTaskPage extends StatelessWidget {
  const NewTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _taskTitleCntrlr = TextEditingController();
    final TextEditingController _taskDescriptionCntrlr =
        TextEditingController();

    return Scaffold(
      appBar: const CustomAppbar(title: 'Add Task'),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextInput(
              textEditingController: _taskTitleCntrlr,
              // maxLine: 1,
              maxLine: 1,
              title: "Task Title",
            ),
            const SizedBox(height: 15),
            Expanded(
              child: SingleChildScrollView(
                child: CustomTextInput(
                  textEditingController: _taskDescriptionCntrlr,
                  title: "Task Description",
                  minLine: 10,
                  // maxLine: 10,
                ),
              ),
            ),
            FloatingActionButton(
                backgroundColor: Consts.mainPurple,
                child: Text("+",
                    style: Consts.titleTextStyle, textAlign: TextAlign.center),
                onPressed: () {
                  print(_taskTitleCntrlr.text);
                  print(_taskDescriptionCntrlr.text);
                })
          ],
        ),
      )),
    );
  }
}

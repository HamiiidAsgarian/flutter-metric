import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_metric/Models/task_model.dart';
import 'package:web_metric/blocs/task_bloc.dart';
import 'package:web_metric/const.dart';
import 'package:web_metric/widgets/custom_appbar.dart';

import '../core/utils.dart';
import '../widgets/custome_textinput.dart';

class NewTaskPage extends StatelessWidget {
  const NewTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController taskTitleCntrlr = TextEditingController();
    final TextEditingController taskDescriptionCntrlr = TextEditingController();

    return Scaffold(
      appBar: const CustomAppbar(title: 'Add Task'),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextInput(
              textEditingController: taskTitleCntrlr,
              // maxLine: 1,
              maxLine: 1,
              title: "Task Title",
            ),
            const SizedBox(height: 15),
            Expanded(
              child: SingleChildScrollView(
                child: CustomTextInput(
                  textEditingController: taskDescriptionCntrlr,
                  title: "Task Description",
                  minLine: 10,
                ),
              ),
            ),
            FloatingActionButton(
                backgroundColor: Consts.mainPurple,
                child: Text("+",
                    style: Consts.titleTextStyle, textAlign: TextAlign.center),
                onPressed: () {
                  BlocProvider.of<TaskBloc>(context).add(AddTask(
                      newTask: Task(
                          title: taskTitleCntrlr.text,
                          description: taskDescriptionCntrlr.text,
                          status: TaskStatus.onProgress)));

                  showSnackBar(
                      context, "New Task Has Been Added", SnackbarType.add);
                  taskTitleCntrlr.clear();
                  taskDescriptionCntrlr.clear();
                })
          ],
        ),
      )),
    );
  }
}

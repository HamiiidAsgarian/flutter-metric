import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_metric/Models/task_model.dart';
import 'package:web_metric/blocs/task_bloc.dart';
import 'package:web_metric/const.dart';
import 'package:web_metric/widgets/custom_appbar.dart';
import '../core/utils.dart';
import '../widgets/custome_textinput.dart';

enum EnterTaskPageType { newTask, editTask }

class EnterTaskPage extends StatelessWidget {
  const EnterTaskPage({
    super.key,
    this.defultTaskData,
    this.pageType = EnterTaskPageType.newTask,
    this.taskIndex,
  });
  final EnterTaskPageType? pageType;
  final Task? defultTaskData;
  final int? taskIndex;

  @override
  Widget build(BuildContext context) {
    final TextEditingController taskTitleCntrlr = TextEditingController();
    final TextEditingController taskDescriptionCntrlr = TextEditingController();
    if (defultTaskData != null) {
      taskTitleCntrlr.text = defultTaskData!.title;
      taskDescriptionCntrlr.text = defultTaskData!.description;
    }

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
            editOrInsertTaskButtonGeneratot(
                context, taskTitleCntrlr, taskDescriptionCntrlr)
          ],
        ),
      )),
    );
  }

  ///To avoid making different pages for Edit and Insert tasks this function generates reletive buttons
  editOrInsertTaskButtonGeneratot(BuildContext context,
      TextEditingController title, TextEditingController description) {
    if (pageType == EnterTaskPageType.newTask) {
      return FloatingActionButton(
          backgroundColor: Consts.mainPurple,
          child: Text("+",
              style: Consts.titleTextStyle, textAlign: TextAlign.center),
          onPressed: () {
            BlocProvider.of<TaskBloc>(context).add(AddTask(
                newTask: Task(
                    title: title.text,
                    description: description.text,
                    status: TaskStatus.onProgress)));

            showSnackBar(context, "New Task Has Been Added", SnackbarType.add);
            title.clear();
            description.clear();
          });
    } else {
      return SizedBox(
        width: double.infinity,
        child: CupertinoButton(
            color: Colors.red,
            onPressed: () {
              BlocProvider.of<TaskBloc>(context).add(EditTask(
                  task: Task(
                      title: title.text,
                      description: description.text,
                      status: TaskStatus.onProgress),
                  taskIndex: taskIndex!));

              showSnackBar(
                  context, "Task Has Been Edited", SnackbarType.delete);
            },
            child: const Text("Edit")),
      );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_metric/Models/task_model.dart';
import 'package:web_metric/blocs/task_bloc.dart';
import 'package:web_metric/const.dart';
import 'package:web_metric/core/utils.dart';
import 'package:web_metric/pages/newtask_page.dart';
import 'package:web_metric/widgets/popup_menu.dart';
import 'package:web_metric/widgets/task_card.dart';
import '../widgets/custom_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'Tasks'),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text("Show Filter: ", style: Consts.cardTextStyle),
                    BlocBuilder<TaskBloc, TaskState>(
                      builder: (context, state) {
                        return Text(state.filterStatus!.name.toString(),
                            style: Consts.cardTextStyle);
                      },
                    ),
                  ],
                ),

                ///sets the filter status in bloc to fetch the relevant list later in the list
                CustomPopup(onSelected: (e) {
                  //NOTE switch case might be cleaner
                  if (e == TaskStatus.completed.name) {
                    BlocProvider.of<TaskBloc>(context)
                        .add(SetFilter(newFilter: TaskStatus.completed));
                  } else if (e == TaskStatus.onProgress.name) {
                    BlocProvider.of<TaskBloc>(context)
                        .add(SetFilter(newFilter: TaskStatus.onProgress));
                  } else {
                    BlocProvider.of<TaskBloc>(context)
                        .add(SetFilter(newFilter: TaskStatus.both));
                  }
                }),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Theme(
                data: Consts.taskCartTransparentTheme,
                child: BlocBuilder<TaskBloc, TaskState>(
                  builder: (context, state) {
                    List<Widget> res = [];
                    for (int i = 0; i < state.tasks.length; i++) {
                      if (state.tasks[i].status == state.filterStatus ||
                          state.filterStatus == TaskStatus.both) {
                        res.add(Container(
                          key: ValueKey('t$i'),
                          margin: const EdgeInsets.only(bottom: 10),
                          child: TaskCard(
                              data: state.tasks[i],
                              onTapStatus: () {
                                BlocProvider.of<TaskBloc>(context).add(EditTask(
                                    task: state.tasks[i].changeStatus(),
                                    taskIndex: i));

                                showSnackBar(context, "Status Has Been Change",
                                    SnackbarType.add);
                              },
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EnterTaskPage(
                                            //NOTE should get changed later
                                            taskIndex: i,
                                            pageType:
                                                EnterTaskPageType.editTask,
                                            defultTaskData: state.tasks[i])));
                              }),
                        ));
                      }
                    }
                    if (res.isNotEmpty) {
                      return ReorderableListView(
                          children: res,
                          onReorder: (int oldIndex, int newIndex) {
                            /// if a cart draged down from its previus position then because an item has been removed new item should position one element lower that [newIndex]
                            if (newIndex > oldIndex) newIndex -= 1;
                            BlocProvider.of<TaskBloc>(context).add(ReplaceTask(
                                oldIndex: oldIndex, newIndex: newIndex));
                          });
                    }
                    return const Center(child: Text("List is Empty"));
                  },
                ),
              ),
            ),
            FloatingActionButton.large(
                backgroundColor: Consts.mainPurple,
                child: Text("Add Task",
                    textAlign: TextAlign.center, style: Consts.cardTextStyle),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EnterTaskPage()));
                })
          ],
        ),
      )),
    );
  }
}

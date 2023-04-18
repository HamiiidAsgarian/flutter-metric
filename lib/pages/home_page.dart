import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_metric/blocs/task_bloc.dart';
import 'package:web_metric/const.dart';
import 'package:web_metric/pages/newtask_page.dart';
import 'package:web_metric/widgets/task_card.dart';
import '../widgets/custom_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // final ValueNotifier tasks = ValueNotifier([
    //   '1111111111111111111111111111111111111111111112222222222222222222222222222222222222222222222222222222221',
    //   't2',
    //   't3'
    // ]);
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
                Text("Filter", style: Consts.cardTextStyle),
                const SizedBox(height: 5),
                Text("V", style: Consts.cardTextStyle),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Container(
                // color: Colors.red,
                child: Theme(
                  data: Consts.taskCartTransparentTheme,
                  child: BlocBuilder<TaskBloc, TaskState>(
                    builder: (context, state) {
                      return ReorderableListView(
                          // buildDefaultDragHandles: false,
                          children: List.generate(state.tasks.length, (index) {
                            return Container(
                              key: ValueKey('t$index'),
                              margin: const EdgeInsets.only(bottom: 5),
                              child: TaskCard(
                                  data: state.tasks[index],
                                  onTapStatus: () {
                                    BlocProvider.of<TaskBloc>(context).add(
                                        EditTask(
                                            task: state.tasks[index]
                                                .changeStatus(),
                                            taskIndex: index));
                                  },
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => EnterTaskPage(
                                                //NOTE should change
                                                taskIndex: index,
                                                pageType:
                                                    EnterTaskPageType.editTask,
                                                defultTaskData:
                                                    state.tasks[index])));
                                  }),
                            );
                          }),
                          onReorder: (int oldIndex, int newIndex) {
                            if (newIndex > oldIndex) newIndex -= 1;
                            BlocProvider.of<TaskBloc>(context).add(ReplaceTask(
                                oldIndex: oldIndex, newIndex: newIndex));
                          });
                    },
                  ),
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

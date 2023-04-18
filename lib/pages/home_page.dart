import 'package:flutter/material.dart';
import 'package:web_metric/const.dart';
import 'package:web_metric/pages/newtask_page.dart';
import 'package:web_metric/widgets/task_card.dart';
import '../widgets/custom_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier tasks = ValueNotifier([
      '1111111111111111111111111111111111111111111112222222222222222222222222222222222222222222222222222222221',
      't2',
      't3'
    ]);
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
            Expanded(
                child: Container(
                    color: Colors.red,
                    child: ValueListenableBuilder(
                        valueListenable: tasks,
                        builder: (context, value, child) {
                          return Theme(
                            data: Consts.taskCartTransparentTheme,
                            child: ReorderableListView(
                                // buildDefaultDragHandles: false,
                                children: List.generate(
                                    value.length,
                                    (index) => Container(
                                          key: ValueKey('t$index'),
                                          margin:
                                              const EdgeInsets.only(bottom: 5),
                                          child: TaskCard(data: value[index]),
                                        )),
                                onReorder: (int oldIndex, int newIndex) {
                                  if (newIndex > oldIndex) newIndex -= 1;
                                  final String item = value.removeAt(oldIndex);
                                  tasks.value = List.from(tasks.value)
                                    ..insert(newIndex, item);
                                }),
                          );
                        }))),
            FloatingActionButton(
                child: const Text("New Task", textAlign: TextAlign.center),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NewTaskPage()));
                })
          ],
        ),
      )),
    );
  }
}

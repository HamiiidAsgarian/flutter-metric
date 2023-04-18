import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:web_metric/widgets/task_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier tasks = ValueNotifier(['t1', 't2', 't3']);
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Tasks"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [Text("Filter"), Text("V")],
            ),
            Expanded(
                child: Container(
                    color: Colors.red,
                    child: ValueListenableBuilder(
                        valueListenable: tasks,
                        builder: (context, value, child) {
                          return ReorderableListView(
                              padding: const EdgeInsets.all(15),
                              // buildDefaultDragHandles: false,
                              children: List.generate(
                                  value.length,
                                  (index) => TaskCard(
                                      key: ValueKey('t$index'),
                                      data: value[index])),
                              onReorder: (int oldIndex, int newIndex) {
                                if (newIndex > oldIndex) newIndex -= 1;
                                final String item = value.removeAt(oldIndex);
                                tasks.value = List.from(tasks.value)
                                  ..insert(newIndex, item);
                              });
                        }))),
            FloatingActionButton(
                child: const Text("New Task", textAlign: TextAlign.center),
                onPressed: () {})
          ],
        ),
      )),
    );
  }
}

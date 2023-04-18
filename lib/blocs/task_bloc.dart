// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Models/task_model.dart';

abstract class TaskEvent {}

class AddTask extends TaskEvent {
  Task newTask;
  AddTask({required this.newTask});
}

class ReplaceTask extends TaskEvent {
  int oldIndex;
  int newIndex;

  ReplaceTask({required this.oldIndex, required this.newIndex});
}

class EditTask extends TaskEvent {
  Task task;
  int taskIndex;
  EditTask({required this.task, required this.taskIndex});
}

class SetFilter extends TaskEvent {
  TaskStatus newFilter;
  SetFilter({required this.newFilter});
}

//--------------------------------------------------------
abstract class TaskState {
  TaskState({required this.tasks, required this.filterStatus});
  List<Task> tasks;
  TaskStatus? filterStatus;
}

class TaskInit extends TaskState {
  TaskInit() : super(tasks: [], filterStatus: TaskStatus.both);
}

class TaskUpdate extends TaskState {
  TaskUpdate({required super.tasks, required super.filterStatus});
}

//--------------------------------------------------------
class TaskBloc extends Bloc<TaskEvent, TaskState> {
  List<Task> tasksTemp = [];
  TaskStatus filterStatus = TaskStatus.both;

  TaskBloc() : super(TaskInit()) {
    on<AddTask>(addTask);
    on<ReplaceTask>(replaceTask);
    on<EditTask>(editTask);
    on<SetFilter>(setFilter);
  }

  addTask(AddTask event, Emitter<TaskState> emit) {
    tasksTemp.add(event.newTask);
    emit(TaskUpdate(tasks: tasksTemp, filterStatus: filterStatus));
  }

  replaceTask(ReplaceTask event, Emitter<TaskState> emit) {
    Task removedTask = tasksTemp.removeAt(event.oldIndex);
    tasksTemp.insert(event.newIndex, removedTask);
    emit(TaskUpdate(tasks: tasksTemp, filterStatus: filterStatus));
  }

  editTask(EditTask event, Emitter<TaskState> emit) {
    tasksTemp[event.taskIndex] = event.task;
    emit(TaskUpdate(tasks: tasksTemp, filterStatus: filterStatus));
  }

  setFilter(SetFilter event, Emitter<TaskState> emit) {
    filterStatus = event.newFilter;
    if (filterStatus == TaskStatus.both) {
      emit(TaskUpdate(tasks: tasksTemp, filterStatus: filterStatus));
    } else {
      emit(TaskUpdate(tasks: tasksTemp, filterStatus: filterStatus));
    }
  }

  // setFilter(TaskStatus status) {
  //   filterStatus = status;
  // }
}

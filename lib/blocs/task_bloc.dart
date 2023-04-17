// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class TaskEvent {}

class AddTask extends TaskEvent {
  List<Task> data;
  AddTask({required this.data});
}

//--------------------------------------------------------
abstract class TaskState {
  TaskState({required this.tasks});
  List<Task> tasks;
}

class TaskInit extends TaskState {
  TaskInit() : super(tasks: []);
}

class TaskUpdate extends TaskState {
  TaskUpdate({required super.tasks});
}

//--------------------------------------------------------
class CartBloc extends Bloc<TaskEvent, TaskState> {
  List<Task> tasksTemp = [];

  CartBloc() : super(TaskInit()) {
    on<AddTask>(addTask);
  }

  addTask(AddTask event, Emitter<TaskState> emit) {
    emit(TaskUpdate(tasks: tasksTemp));
  }
}

class Task {}

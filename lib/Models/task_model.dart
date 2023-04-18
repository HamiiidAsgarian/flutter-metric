class Task {
  Task(
      {this.id,
      required this.title,
      required this.description,
      required this.status});
  final int? id;
  final String title;
  final String description;
  TaskStatus status;

  changeStatus() {
    if (status == TaskStatus.completed) {
      status = TaskStatus.onProgress;
    } else {
      status = TaskStatus.completed;
    }
    return Task(title: title, description: description, status: status);
  }
}

//NOTE There should be another enum just for filter status however because of the simplicity of the app it has been merged with task status
enum TaskStatus { completed, onProgress, both }

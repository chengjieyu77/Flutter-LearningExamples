import 'package:flutter/material.dart';
import 'package:todoappmy/data/data.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({super.key, required this.task, this.onCompleted});
  final Task task;
  final Function(bool?)? onCompleted;

  @override
  Widget build(BuildContext context) {
    final textDecoration =
        task.isCompleted ? TextDecoration.lineThrough : TextDecoration.none;
    return ListTile(
      leading: Icon(
        task.category.icon,
        color: task.category.color,
      ),
      title: Text(task.title),
      subtitle: Text(task.time),
      trailing: Checkbox(
        onChanged: onCompleted,
        value: task.isCompleted,
      ),
      titleTextStyle:
          TextStyle(color: Colors.black, decoration: textDecoration),
      titleAlignment: ListTileTitleAlignment.center,
    );
  }
}

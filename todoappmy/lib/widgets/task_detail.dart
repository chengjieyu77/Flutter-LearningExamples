import 'package:flutter/material.dart';

import '../data/models/task.dart';

class TaskDetail extends StatelessWidget {
  const TaskDetail({super.key, required this.task});
  final Task task;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            task.category.icon,
            color: task.category.color,
          ),
          Text(task.title),
          Text(task.time),
          Divider(
            thickness: 1.5,
            color: task.category.color,
          ),
          Visibility(
              visible: !task.isCompleted,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('task to be ompleted on ${task.date}'),
                  Icon(
                    Icons.check_box,
                    color: task.category.color,
                  )
                ],
              )),
          Text(task.note.isEmpty
              ? 'There is no additional note for this task'
              : task.note)
        ],
      ),
    );
  }
}

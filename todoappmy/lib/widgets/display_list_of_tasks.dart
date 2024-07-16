import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoappmy/utils/app_alerts.dart';
import 'package:todoappmy/widgets/common_container.dart';
import 'package:todoappmy/widgets/widgets.dart';

import '../data/data.dart';
import '../providers/task/task_provider.dart';

class DisplayListOfTasks extends ConsumerWidget {
  DisplayListOfTasks(
      {super.key, required this.tasks, this.isCompletedTasks = false});
  final List<Task> tasks;
  bool isCompletedTasks;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emptyTasksMessage = isCompletedTasks
        ? 'There is no completed task'
        : 'There is no task todo';
    return CommonContainer(
      heightPercentage: isCompletedTasks ? 0.25 : 0.3,
      child: tasks.isEmpty
          ? Center(child: Text(emptyTasksMessage))
          : ListView.separated(
              shrinkWrap: true,
              itemCount: tasks.length,
              padding: EdgeInsets.zero,
              itemBuilder: (ctx, index) {
                final Task task = tasks[index];
                return InkWell(
                    onLongPress: () {
                      AppAlerts.showDeleteAlertDialog(context, ref, task);
                    },
                    onTap: () async {
                      await showModalBottomSheet(
                          context: context,
                          builder: (ctx) {
                            return TaskDetail(task: task);
                          });
                    },
                    child: TaskTile(
                      task: task,
                      onCompleted: (value) async {
                        await ref
                            .read(taskProvider.notifier)
                            .updateTask(task)
                            .then((value) {
                          AppAlerts.displaySnackBar(
                              context,
                              task.isCompleted
                                  ? 'Task incompleted'
                                  : 'Task is completed');
                        });
                      },
                    ));
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  thickness: 1.5,
                );
              },
            ),
    );
  }
}

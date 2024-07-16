import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todoappmy/providers/providers.dart';
import 'package:todoappmy/utils/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/models/task.dart';
import 'package:go_router/go_router.dart';

class AppAlerts {
  AppAlerts._();

  static displaySnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        style: context.textTheme.bodyLarge,
      ),
      backgroundColor: context.colorScheme.surface,
    ));
  }

  static Future<void> showDeleteAlertDialog(
      BuildContext context, WidgetRef ref, Task task) async {
    Widget cancelButton = TextButton(
        onPressed: () {
          return context.pop();
        },
        child: Text("NO"));
    Widget deleteButton = TextButton(
        onPressed: () async {
          await ref.read(taskProvider.notifier).deleteTask(task).then((value) {
            context.pop();
            AppAlerts.displaySnackBar(context, 'deleted a task!');
          });
        },
        child: Text("YES"));
    AlertDialog alert = AlertDialog(
      title: Text('Are you sure you want to delete this task?'),
      actions: [cancelButton, deleteButton],
    );

    await showDialog(
        context: context,
        builder: (context) {
          return alert;
        });
  }
}
